import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumTextfield extends StatelessWidget {
  final String hintText;
  final bool isNumber;
  final TextEditingController controller;
  final bool obscureText;

  const CostumTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blue, width: 1.4),
          ),
        ),
      ),
    );
  }
}
