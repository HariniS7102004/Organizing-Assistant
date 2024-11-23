import 'package:flutter/material.dart';

class TextDisplay extends StatelessWidget {
  final String text;          
  final double fontSize;      
  final FontWeight fontWeight;
  final Color color; 

  const TextDisplay({
    super.key,
    required this.text,
    this.fontSize = 14,         
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}