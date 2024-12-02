import 'package:flutter/material.dart';


class ThemeCard extends StatelessWidget {
  final Map<String, String> theme;

  const ThemeCard({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    String name = theme['name']!;
    String imagePath = theme['image']!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            height: 80,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          name,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}