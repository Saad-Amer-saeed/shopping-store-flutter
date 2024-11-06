import 'package:flutter/material.dart';
import 'package:shoppingstore/screen/merchents_screen.dart';
import 'package:shoppingstore/screen/nav_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, // Set the default background color to white
      ),
      home: Scaffold(
        body: TabNavigationScreen(),
      ),
    );
  }
}
