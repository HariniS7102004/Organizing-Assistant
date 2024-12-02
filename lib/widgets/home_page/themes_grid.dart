// import 'package:flutter/material.dart';
// import 'theme_card.dart';

// class ThemesGrid extends StatelessWidget {

//   const ThemesGrid({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> themes = [
//       {'name': 'Vintage', 'image': 'lib/images/designs/vintage.jpg'},
//       {'name': 'Boho', 'image': 'lib/images/designs/boho.jpg'},
//       {'name': 'Modern', 'image': 'lib/images/designs/modern.jpg'},
//       {'name': 'Rustic', 'image': 'lib/images/designs/rustic.jpg'},
//       {'name': 'Classic', 'image': 'lib/images/designs/classic.jpg'},
//       {'name': 'Minimalist', 'image': 'lib/images/designs/minimalist.jpg'},
//       {'name': 'Nautical', 'image': 'lib/images/designs/nautical.jpg'},
//       {'name': 'Scandinavian', 'image': 'lib/images/designs/scandinavian.jpg'},
//     ];

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const BouncingScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 8,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//       ),
//       itemCount: themes.length,
//       itemBuilder: (context, index) {
//         return ThemeCard(theme: themes[index]);
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'theme_card.dart';

class ThemesGrid extends StatelessWidget {
  const ThemesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> themes = [
      {'name': 'Vintage', 'image': 'lib/images/designs/vintage.jpg'},
      {'name': 'Boho', 'image': 'lib/images/designs/boho.jpg'},
      {'name': 'Modern', 'image': 'lib/images/designs/modern.jpg'},
      {'name': 'Rustic', 'image': 'lib/images/designs/rustic.jpg'},
      {'name': 'Classic', 'image': 'lib/images/designs/classic.jpg'},
      {'name': 'Minimalist', 'image': 'lib/images/designs/minimalist.jpg'},
      {'name': 'Nautical', 'image': 'lib/images/designs/nautical.jpg'},
      {'name': 'Scandinavian', 'image': 'lib/images/designs/scandinavian.jpg'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Makes the grid scroll horizontally
      child: Row(
        children: themes.map((theme) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ThemeCard(theme: theme),
          );
        }).toList(),
      ),
    );
  }
}
