import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final int? line;

  const InputText(
      {super.key,
      required this.hint,
      required this.obscure,
      this.controller,
      this.line});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        maxLines: line,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
