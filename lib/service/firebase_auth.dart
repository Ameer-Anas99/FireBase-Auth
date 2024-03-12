import 'dart:math';

import 'package:chat_app/components/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethods(this._auth);
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    // for any os
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      }, 
      verificationFailed: (e) {
        showSnackbar(context,e.message!);
        print(e.message);
      } 
      codeSent: ((String (verificationId, forceResendingToken) {
        showotp
      })), 
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
  }
}
