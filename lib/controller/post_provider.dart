import 'package:chat_app/model/mesage.dart';
import 'package:chat_app/service/db_service.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  DbService postservices = DbService();
  TextEditingController textcontroller = TextEditingController();
  List<Message> posts = [];

  Future<void> addPost(String user, String message) async {
    await postservices.addPost(user, message, []);
    notifyListeners();
  }

  Future<void> deletePost(String postid) async {
    await postservices.deletePost(postid);
    notifyListeners();
  }

  Future<void> toggleLike(String postid, bool isLiked) async {
    await postservices.toggleLike(postid, isLiked);
    notifyListeners();
  }
}
