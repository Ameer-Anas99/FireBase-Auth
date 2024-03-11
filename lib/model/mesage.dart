import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? id;
  String? message;
  String? email;
  List<String>? Likes;
  DateTime? timestamp;

  Message({
    this.id,
    this.message,
    this.email,
    this.Likes,
    this.timestamp,
  });
  factory Message.fromJson(String id, Map<String, dynamic> json) {
    return Message(
      id: id,
      message: json['message'],
      email: json['UserEmail'],
      Likes: List<String>.from(json['Likes'] ?? []),
      timestamp: json['timestamp'] != null
          ? (json['timestamp'] as Timestamp).toDate()
          : null,
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'UserEmail': email,
      'message': message,
      'Likes': Likes,
      'timestamp': timestamp,
    };
  }
}
