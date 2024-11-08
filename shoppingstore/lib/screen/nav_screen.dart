import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoppingstore/screen/basket_screen.dart';
import 'package:shoppingstore/screen/merchents_screen.dart';
import 'package:shoppingstore/screen/login_screen.dart';
import 'package:badges/badges.dart' as badges;

class TabNavigationScreen extends StatefulWidget {
  const TabNavigationScreen({Key? key}) : super(key: key);

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> {
  int _selectedIndex = 0;
  final int _basketItemCount = 0; // Mock basket item count
  // Customizable values
  double horizontalMargin = 0; // Horizontal margin
  double borderRadiusValue = 1; // Border radius for bottom navigation bar
  double borderWidth = 2.0; // Border width for the bottom navigation bar
  bool showbackbutton = false;
  // List of pages to show for each tab
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize _pages after state initialization
    _pages = <Widget>[
      const MerchentsScreen(),
      BasketScreen(showbackbutton), // Pass the value directly here
      const LoginPage(),
    ];
  }

  // Change the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page

      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 0.6, // Border width
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), // Top left corner rounded
            topRight: Radius.circular(18), // Top right corner rounded
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), // Top left corner rounded
            topRight: Radius.circular(18), // Top right corner rounded
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white, // Background color
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _basketItemCount < 1
                    ? const Icon(Icons.shopping_cart)
                    : badges.Badge(
                        badgeContent: Text(
                          '$_basketItemCount',
                          style: const TextStyle(color: Colors.white),
                        ),
                        child: const Icon(Icons.shopping_cart),
                      ),
                label: 'Basket',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.login),
                label: 'Login',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue, // Customize selected item color
            onTap: _onItemTapped, // Handle item tap
          ),
        ),
      ),
    );
  }
}
