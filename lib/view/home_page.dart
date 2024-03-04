import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 52, 91, 110),
      appBar: AppBar(
        title: const Text("Chat App"),
        actions: [
          // sign out button
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
