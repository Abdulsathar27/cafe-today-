import 'package:cafebooking/models/products.dart';
import 'package:cafebooking/widgets/homewidgets/home_search_bar.dart';
import 'package:cafebooking/widgets/homewidgets/homewidgets.dart';
import 'package:cafebooking/widgets/homewidgets/product_grid.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Biriyani', price: 5.0, image: 'assets/Images/chickenbiryani.png'),
    Product(name: 'Fried Chicken', price: 10.0, image: ''),
    Product(name: 'Fried Rice', price: 12.5, image: ''),
    Product(name: 'Noodles', price: 13.5, image: ''),
    Product(name: 'Chicken Currey', price: 12.0, image: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      appBar: buildHomeAppBar(context),
      body: Column(
        children: [
          const HomeSearchBar(),
          Expanded(child: ProductGrid(products:products)),
        ],
      ),
    );
  }
}
