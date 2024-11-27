import 'package:flutter/material.dart';
import 'package:hoololi/utils/constants.dart';
import 'login_pg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/bg_img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "WELCOME TO",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.darkPinkColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "HO'OLOLI",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.darkPinkColor,
                    fontStyle: FontStyle.italic
                  ),
                ),
                const SizedBox(height: 50),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()), 
                            );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.darkPinkColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    // Handle signup button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstants.darkPinkColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}