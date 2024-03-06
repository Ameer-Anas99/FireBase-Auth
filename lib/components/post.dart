import 'package:chat_app/components/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;

  const PostPage(
      {super.key,
      required this.message,
      required this.user,
      required this.postId,
      required this.likes});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  // toggle like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    // Access the document is firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection("User Posts").doc(widget.postId);

    if (isLiked) {
      // liked
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      // unliked
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          // // profile pic
          // Container(
          //   decoration: const BoxDecoration(
          //       shape: BoxShape.circle, color: Colors.blueGrey),
          //   padding: EdgeInsets.all(10),
          //   child: Icon(
          //     Icons.person,
          //     color: Colors.white,
          //   ),
          // ),
          // Like Button
          Column(
            children: [
              LikeButton(
                isLiked: isLiked,
                onTap: toggleLike,
              ),
              const SizedBox(
                height: 5,
              ),

              // like count
              Text(widget.likes.length.toString()),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          // message and user email
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user,
                style: TextStyle(color: Colors.teal),
              ),
              SizedBox(
                height: 3,
              ),
              Text(widget.message),
            ],
          ),
        ],
      ),
    );
  }
}
