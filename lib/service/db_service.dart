import 'package:chat_app/model/mesage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  String collection = 'User Post';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<Message> messageRef;

  DbService() {
    messageRef = firestore.collection(collection).withConverter<Message>(
          fromFirestore: (snapshot, options) =>
              Message.fromJson(snapshot.id, snapshot.data()!),
          toFirestore: (value, options) => value.tojson(),
        );
  }
  Stream<QuerySnapshot<Message>> getDataOrderByTimeStamp() {
    return messageRef
        .orderBy('timestamp', descending: true)
        .snapshots()
        .handleError((error) {
      print('Error fetching data: $error');
    });
  }

  Future<void> addPost(String user, String message, List<String> Likes) async {
    try {
      await messageRef.add(
        Message(
          Likes: Likes,
          email: user,
          timestamp: DateTime.now(),
        ),
      );
    } catch (e) {
      print("Error adding post : $e");
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await firestore
          .collection(collection)
          .doc(postId)
          .delete()
          .then((value) => print('delete'))
          .catchError((error) => print('Failed to delete post: $error'));
    } catch (e) {
      print("Error deleting post :$e");
    }
  }

  Future<void> toggleLike(String postId, bool isLiked) async {
    DocumentReference postref = firestore.collection(collection).doc(postId);
    if (isLiked) {
      postref.update({
        'Likes':
            FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.email])
      });
    }
  }

  String capitalizedFirstLetter(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      } else {
        return word;
      }
    }).join(' ');
  }

  Future<List<String>> getUserNames() async {
    try {
      QuerySnapshot<Message> snapshot = await messageRef.get();
      return snapshot.docs.map((docs) => docs.data().email ?? "").toList();
    } catch (e) {
      print("Error fetching user names : $e");
      return [];
    }
  }
}
