import 'package:flutter/material.dart';

class TextBoxPage extends StatelessWidget {
  final String text;
  final String selectionName;
  final void Function()? onPressed;

  const TextBoxPage(
      {super.key,
      required this.text,
      required this.selectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // select name
              Text(
                selectionName,
                style: const TextStyle(color: Color.fromARGB(255, 87, 87, 87)),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
