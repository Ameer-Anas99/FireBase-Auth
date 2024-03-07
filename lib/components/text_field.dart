import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsureText;
  const TextFieldPage(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
