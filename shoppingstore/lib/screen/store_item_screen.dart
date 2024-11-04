import 'package:flutter/material.dart';

class StoreItemScreen extends StatelessWidget {
  const StoreItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.network(
              "https://d2yugwrr6or5n1.cloudfront.net/uploads/1534413528.jpg",
              width: double.infinity, // Adjust width as needed
              height: 250, // Adjust height as needed
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20), // Add space between image and text
            Text("data"),
          ],
        ),
      ),
    );
  }
}
