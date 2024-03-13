import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final Function()? onTap;
  final String text;

  ButtonPage({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
        )),
      ),
    );
  }
}
