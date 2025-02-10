import 'package:flutter/material.dart';
import 'package:hoololi/utils/constants.dart';
import '../widgets/home_page/section_header.dart';
import '../widgets/home_page/themes_grid.dart';
import '../widgets/home_page/products_grid.dart';
import 'input_layout.dart';

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
        backgroundColor: AppConstants.darkPinkColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'HO\'OLOLI',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            'lib/images/home_img.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InputLayout()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.darkPinkColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text('CREATE NEW', style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstants.darkPinkColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Text('BOOK AN APPOINTMENT', overflow: TextOverflow.clip, style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'lib/images/main_pg_hall_img_1.jpg', 
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),                    
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'lib/images/main_pg_hall_img_2.jpg', 
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'lib/images/main_pg_hall_img_3.jpg', 
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'lib/images/main_pg_hall_img_4.jpg', 
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                    )
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
                ]
              )
            ),
          )
        ]
      )
    );     
  }
}