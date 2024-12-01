import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {

  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Lamps', 'image': 'lib/images/bg_img.jpg'},
      {'name': 'Vases', 'image': 'lib/images/bg_img.jpg'},
      {'name': 'Cutlery', 'image': 'lib/images/bg_img.jpg'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}