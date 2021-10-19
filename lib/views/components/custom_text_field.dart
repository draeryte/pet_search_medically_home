import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.searchField,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController searchField;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchField,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
