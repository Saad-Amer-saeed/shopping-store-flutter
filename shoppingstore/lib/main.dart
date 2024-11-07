import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:shoppingstore/screen/merchents_screen.dart';
import 'package:shoppingstore/screen/nav_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // Wrap your app with ProviderScope to enable Riverpod
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor:
              Colors.white, // Set the default background color to white
        ),
        home: Scaffold(
          body: TabNavigationScreen(), // Your main screen with tab navigation
        ),
      ),
    );
  }
}
