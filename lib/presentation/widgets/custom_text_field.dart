// lib/widgets/custom_text_field.dart

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final bool isNumber;
  final bool isItem;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool isObscure;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.isNumber = false,
    this.isItem = false,
    this.onTap,
    this.onChanged,
    this.isObscure = false,
    String? Function(dynamic value)? validator,
  });

  @override
  Widget build(BuildContext context) {
    if (isItem && controller.text.isEmpty) {
      controller.text = '1';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        style: const TextStyle(color: Colors.blueAccent),
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        readOnly: readOnly,
        decoration: InputDecoration(
          fillColor: Colors.blueAccent,
          labelText: label,
          border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
          ),
        ),
        obscureText: isObscure,
      ),
    );
  }
}
