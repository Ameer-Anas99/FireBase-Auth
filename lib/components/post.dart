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
    return Row(
      children: [
        Column(
          children: [
            Text(user),
            Text(message),
          ],
        ),
      ],
    );
  }
}
