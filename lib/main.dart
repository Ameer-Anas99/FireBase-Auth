import 'package:chat_app/authentication/login_or_register.dart';
import 'package:chat_app/view/login_page.dart';
import 'package:chat_app/view/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginOrRegister());
  }
}
