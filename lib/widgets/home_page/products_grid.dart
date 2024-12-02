// import 'package:flutter/material.dart';
// import 'product_card.dart';

// class ProductsGrid extends StatelessWidget {

//   const ProductsGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> products = [
//   {'name': 'Chairs', 'image': 'lib/images/products/chair.jpg'},
//   {'name': 'Lamps', 'image': 'lib/images/products/lamp.jpg'},
//   {'name': 'Vases', 'image': 'lib/images/products/vase.jpg'},
//   {'name': 'Antiques', 'image': 'lib/images/products/antiques.jpg'},
//   {'name': 'Chandelier', 'image': 'lib/images/products/chandelier.jpg'},
//   {'name': 'Dine-ware', 'image': 'lib/images/products/dineware.jpg'},
//   {'name': 'Frames', 'image': 'lib/images/products/frames.jpg'},
//   {'name': 'Wall hangings', 'image': 'lib/images/products/wall_hangings.jpg'},
// ];

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 8,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         return ProductCard(product: products[index]);
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = [
      {'name': 'Chairs', 'image': 'lib/images/products/chair.jpg'},
      {'name': 'Lamps', 'image': 'lib/images/products/lamp.jpg'},
      {'name': 'Vases', 'image': 'lib/images/products/vase.jpg'},
      {'name': 'Antiques', 'image': 'lib/images/products/antiques.jpg'},
      {'name': 'Chandelier', 'image': 'lib/images/products/chandelier.jpg'},
      {'name': 'Dine-ware', 'image': 'lib/images/products/dineware.jpg'},
      {'name': 'Frames', 'image': 'lib/images/products/frames.jpg'},
      {'name': 'Wall hangings', 'image': 'lib/images/products/wall_hangings.jpg'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Makes the grid scroll horizontally
      child: Row(
        children: products.map((product) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ProductCard(product: product),
          );
        }).toList(),
      ),
    );
  }
}
