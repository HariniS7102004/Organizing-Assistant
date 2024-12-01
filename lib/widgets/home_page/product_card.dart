import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            product['image']!,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          product['name']!,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}