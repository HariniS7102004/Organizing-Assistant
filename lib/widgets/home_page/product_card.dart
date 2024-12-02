// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final Map<String, Object> product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     String name = product['name'] as String;
//     Image image = product['image'] as Image;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Image.asset(
//             image.toString(),
//             height: 60,
//             width: 60,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(height: 4.0),
//         Text(
//           name,
//           style: const TextStyle(color: Colors.black),
//         ),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String name = product['name']!;
    String imagePath = product['image']!;
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
