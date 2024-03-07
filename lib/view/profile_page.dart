import 'dart:ffi';

import 'package:chat_app/components/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // edit field
  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 100.0),
          child: Text("Profile "),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          // profile pic
          const Icon(
            Icons.person_2_outlined,
            size: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          // user email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "My Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          // Username
          TextBoxPage(
            text: "Ameer Anas",
            selectionName: "username",
            onPressed: () => editField("ameer"),
          ),
          // Bio
          TextBoxPage(
            text: "empty",
            selectionName: "Bio",
            onPressed: () => editField("bio"),
          ),
          SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "My Posts",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
