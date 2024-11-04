import 'package:flutter/material.dart';

class SortOptionsDialog extends StatefulWidget {
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;

  const SortOptionsDialog({
    super.key,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  State<SortOptionsDialog> createState() {
    return _SortOptionsDialogState();
  }
}

class _SortOptionsDialogState extends State<SortOptionsDialog> {
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  void _handleOptionChange(String? value) {
    setState(() {
      selectedOption = value;
    });
    widget.onOptionSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sort By',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            title: const Text('New'),
            trailing: Radio<String>(
              value: 'New',
              groupValue: selectedOption,
              onChanged: _handleOptionChange,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Highest Rating'),
            trailing: Radio<String>(
              value: 'HighestRating',
              groupValue: selectedOption,
              onChanged: _handleOptionChange,
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('A TO Z'),
            trailing: Radio<String>(
              value: 'AtoZ',
              groupValue: selectedOption,
              onChanged: _handleOptionChange,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
