import 'package:flutter/material.dart';

class ListTilePage extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const ListTilePage(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 35,
        ),
        onTap: onTap,
        title: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
