import 'package:flutter/material.dart';
import 'package:shoppingstore/screen/basket_screen.dart';
import 'package:shoppingstore/screen/merchents_screen.dart';

class TabNavigationScreen extends StatefulWidget {
  @override
  State<TabNavigationScreen> createState() {
    return _TabNavigationScreenState();
  }
}

class _TabNavigationScreenState extends State<TabNavigationScreen> {
  int _selectedIndex = 0;

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
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
