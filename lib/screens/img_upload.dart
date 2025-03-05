import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoololi/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:process_run/process_run.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/constants.dart';
import '../widgets/text_display.dart';

class RoomTransformerApp extends StatefulWidget {
  @override
  _RoomTransformerAppState createState() => _RoomTransformerAppState();
}

class _RoomTransformerAppState extends State<RoomTransformerApp> {
  File? _image;
  final TextEditingController _themeController = TextEditingController();
  String? _outputImageUrl;
  final String backendUrl = "http://localhost:5000/transform";

  @override
  void initState() {
    super.initState();
    requestPermissions();
    _startBackend();
  }

Future<void> requestPermissions() async {
  await Permission.storage.request();
  await Permission.manageExternalStorage.request();
}


  Future<void> _startBackend() async {
    try {
      // Start the Flask backend
      final result = await runExecutableArguments('python', ['app.py']);
      print("Backend started: $result");
    } catch (e) {
      print("Error starting backend: $e");
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _sendImage() async {
    if (_image == null || _themeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select an image and enter a theme")),
      );
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse(backendUrl));
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
    request.fields['theme'] = _themeController.text;

    var response = await request.send();

    if (response.statusCode == 200) {
      final bytes = await response.stream.toBytes();
      setState(() {
        _outputImageUrl = base64Encode(bytes);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${response.reasonPhrase}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Room Transformer")),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Opacity(
          opacity: 0.5,
          child: Image.asset(
            'lib/images/home_img.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Container(height: 200, color: Colors.white, child: SizedBox(width: 200, height: 200,)),//Icon(Icons.image, size: 50)),
            SizedBox(height: 10),
            TextField(
              controller: _themeController,
              decoration: InputDecoration(labelText: "Enter Theme (e.g., modern, classic)",
              filled: true,
        fillColor: Colors.white, // TextField background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.darkPinkColor, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const TextDisplay(text: 'Pick Image', fontSize: 16, color: Colors.white),
                ),
            // ElevatedButton(
            //   onPressed: _pickImage,
            //   child: Text("Pick Image"),
            // ),
            const SizedBox(height: 10,),
            ElevatedButton(
                  onPressed: _sendImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.darkPinkColor, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const TextDisplay(text: 'Transform Room', fontSize: 16, color: Colors.white),
                ),
            // ElevatedButton(
            //   onPressed: _sendImage,
            //   child: Text("Transform Room"),
            // ),
            SizedBox(height: 20),
            _outputImageUrl != null
                ? Image.memory(base64Decode(_outputImageUrl!), height: 200)
                : Container(),
          ],
        ),
      ),
        ]
  )
    );
  }
}
