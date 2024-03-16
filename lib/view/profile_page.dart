// ignore_for_file: use_build_context_synchronously
import 'package:chat_app/components/text_box.dart';
import 'package:chat_app/controller/profile_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<ProfileProvider>(
        builder: (context, value, child) => StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(value.currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            //get the user data
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("Waiting for data...");
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final userData = snapshot.data?.data() as Map<String, dynamic>?;

              if (userData == null || userData.isEmpty) {
                print("No user data found.");
                return Center(child: Text('No data found.'));
              }
              print("User data retrieved successfully: $userData");

              return ListView(
                children: [
                  //profile pic
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 226, 220, 220),
                      radius: 50,
                      child: Image.asset(
                        'assets/user.png',
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //user email
                  Text(
                    value.currentUser.email!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  //user details
                  Text(
                    'My details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  //username
                  MyTextBox(
                    text: userData['username'] ?? '',
                    sectionName: 'Username',
                    onPressed: () => value.editFields(
                        'username', context), // changed to lowercase
                  ),
                  //bio
                  SizedBox(height: 20),
                  MyTextBox(
                    text: userData['bio'] ?? '',
                    sectionName: ' Bio',
                    onPressed: () => value.editFields(
                        'bio', context), // changed to lowercase
                  ),
                  //user posts
                  SizedBox(height: 20),
                  Text(
                    'My post',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
