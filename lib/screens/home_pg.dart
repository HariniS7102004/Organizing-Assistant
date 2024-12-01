import 'package:flutter/material.dart';
import '../widgets/home_page/section_header.dart';
import '../widgets/home_page/themes_grid.dart';
import '../widgets/home_page/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: null,
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade400,
            elevation: 0,
            title: const Center(
              child: Text(
                'HO\'OLOLI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Image.asset(
          'lib/images/home_img.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Text('CREATE NEW', style: TextStyle(color: Colors.white),),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo.shade500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text('BOOK AN APPOINTMENT', style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      'lib/images/bg_img.jpg', // Replace with your image URL
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(color: Colors.black, thickness: 2),
                  const SizedBox(height: 16.0),
                  const SectionHeader(title: 'THEMES'),
                  const SizedBox(height: 8.0),
                  const ThemesGrid(),
                  const SizedBox(height: 16.0),
                  const SectionHeader(title: 'PRODUCTS'),
                  const SizedBox(height: 8.0),
                  const ProductsGrid(),
                ],
              ),
            ),
          ),
      ]
        )
    );
  }
}