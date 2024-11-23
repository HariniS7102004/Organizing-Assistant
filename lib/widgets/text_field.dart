import 'package:flutter/material.dart';
import '../utils/constants.dart';

class TextInputBox extends StatefulWidget {
  final TextEditingController? control;
  final Color color;

  const TextInputBox({
    super.key,
    required this.control,
    this.color = AppConstants.textBoxColor,
  });

  @override
  TextInputBoxState createState() => TextInputBoxState();
}

class TextInputBoxState extends State<TextInputBox> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.color, // TextField background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}