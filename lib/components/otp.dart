import 'package:chat_app/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneSignIn extends StatefulWidget {
  const PhoneSignIn({super.key});

  @override
  State<PhoneSignIn> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  void PhoneSignIn() {
    FireBaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text);
  }

  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: 'Enter your phone number',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                PhoneSignIn();
              },
              child: Text(
                "Sent OTP",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
