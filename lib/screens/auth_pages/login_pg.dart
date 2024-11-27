import 'package:flutter/material.dart';
import 'package:hoololi/widgets/text_display.dart';
import 'package:hoololi/widgets/text_field.dart';
import '../../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppConstants.lightPinkColor, // Background color
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: TextDisplay(text: 'WELCOME!', fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              const TextDisplay(text: 'NAME'),
              const SizedBox(height: 5),
              TextInputBox(control: AppConstants.name),
              const SizedBox(height: 20),
              const TextDisplay(text: 'MAIL'),
              const SizedBox(height: 5),
              TextInputBox(control: AppConstants.mail),
              const SizedBox(height: 20),
              const TextDisplay(text: 'PASSWORD'),
              const SizedBox(height: 5),
              TextInputBox(control: AppConstants.password),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.darkPinkColor, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const TextDisplay(text: 'LOG IN', fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     TextDisplay(text: "Don't have an account?", fontSize: 10, color: Colors.black),
              //   ]
              // )
            ],
          ),
        ),
      ),
    );
  }
}
