import 'package:chat_app/components/text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // get user data
          if (snapshot.hasData && snapshot.data!.data() != null) {
            final userData = snapshot.data!.data()! as Map<String, dynamic>;
            return ListView(
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
                  text: userData['username'] ?? 'No Data Found',
                  selectionName: 'username',
                  onPressed: () => editField('username'),
                ),
                // Bio
                TextBoxPage(
                  text: userData['bio'],
                  selectionName: 'bio',
                  onPressed: () => editField('bio'),
                ),
                const SizedBox(
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
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Erro: r${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
