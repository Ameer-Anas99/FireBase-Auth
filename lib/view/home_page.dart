import 'package:chat_app/components/post.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// user
  final currentUser = FirebaseAuth.instance.currentUser!;

  // text controller
  final textController = TextEditingController();

  // sign out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // post message
  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Posts").add({
        "useREmail": currentUser.email,
        "Message": textController.text,
        "TimeStamp": Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 52, 91, 110),
      appBar: AppBar(
        title: const Center(child: Text("Chat App")),
        actions: [
          // sign out button
          IconButton(
            onPressed: signOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // the chat
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("")
                    .orderBy(
                      "",
                      descending: false,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        // get the message
                        final post = snapshot.data!.docs[index];
                        return PostPage(
                          message: post["Message"],
                          user: post["UserEmail"],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error:${snapshot.error}"),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            // post message
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFieldPage(
                        controller: textController,
                        hintText: "Write something on the wall..",
                        obsureText: false),
                  ),
                  IconButton(
                      onPressed: postMessage, icon: Icon(Icons.arrow_circle_up))
                ],
              ),
            ),

            // logged in as
            Text("Logged in as:" + currentUser.email!)
          ],
        ),
      ),
    );
  }
}
