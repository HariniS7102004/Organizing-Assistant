import 'package:flutter/material.dart';
import 'theme_card.dart';

class ThemesGrid extends StatelessWidget {

  const ThemesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themes = [
      {'name': 'Vintage', 'image': 'lib/images/bg_img.jpg'},
      {'name': 'Boho', 'image': 'lib/images/bg_img.jpg'},
      {'name': 'Modern', 'image': 'lib/images/bg_img.jpg'},
      {'name': 'Rustic', 'image': 'lib/images/bg_img.jpg'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: themes.length,
      itemBuilder: (context, index) {
        return ThemeCard(theme: themes[index]);
      },
    );
  }
}