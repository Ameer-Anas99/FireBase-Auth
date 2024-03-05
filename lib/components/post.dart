import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final String message;
  final String user;

  const PostPage({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          // profile pic
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.blueGrey),
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          // message and user email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.teal),
              ),
              SizedBox(
                height: 3,
              ),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }
}
