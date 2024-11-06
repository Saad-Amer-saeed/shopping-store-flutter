import 'package:flutter/material.dart';
import 'package:shoppingstore/screen/basket_screen.dart';
import 'package:shoppingstore/screen/merchents_screen.dart';
import 'package:badges/badges.dart' as badges;

class TabNavigationScreen extends StatefulWidget {
  const TabNavigationScreen({Key? key}) : super(key: key);

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen> {
  int _selectedIndex = 0;
  final int _basketItemCount = 3; // Mock basket item count

  // List of pages to show for each tab
  final List<Widget> _pages = <Widget>[
    const MerchentsScreen(),
    BasketScreen(),
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeContent: Text(
                '$_basketItemCount',
                style: const TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Basket',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Customize selected item color
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }
}

// Home Screen Widget
