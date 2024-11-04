import 'package:flutter/material.dart';

class Checkboxcard extends StatefulWidget {
  const Checkboxcard({super.key});

  @override
  State<Checkboxcard> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<Checkboxcard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false; // Use null-aware operator for safety
        });
      },
      activeColor: Colors.blue, // Color when checked
      checkColor: Colors.white, // Color of the check mark
      side: const BorderSide(color: Colors.red), // Border color when unchecked
    );
  }
}
