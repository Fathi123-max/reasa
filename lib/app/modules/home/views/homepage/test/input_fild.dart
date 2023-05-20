import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
