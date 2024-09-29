import 'package:flutter/material.dart';

class PrimaryDropdownButton extends StatefulWidget {
  const PrimaryDropdownButton({
    super.key,
    required this.items,
  });
  final List<String> items;
  @override
  State<PrimaryDropdownButton> createState() => _PrimaryDropdownButtonState();
}

class _PrimaryDropdownButtonState extends State<PrimaryDropdownButton> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: value ?? widget.items[0],
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (val) {
          setState(() {
            value = val!;
          });
        });
  }
}
