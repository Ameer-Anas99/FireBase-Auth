import 'package:chat_app/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AutheProvider extends ChangeNotifier {
  // change variable name
  AuthServices authServices = AuthServices();
  String? otpcode;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //conform
  final conformpasswordController = TextEditingController();

  bool showLoginPage = true;
  final isGoogleLoading = false;

  User? _user;
  User? get user => _user;

  void togglepages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }

  // sign out
  Future<void> signOut() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

// sign in
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    return authServices.signInWithEmailandPassword(email, password);
  }

  // sign up
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password) async {
    return authServices.signUpWithEmailandPassword(email, password);
  }

  // google sign in
  Future<UserCredential> signInWithGoogle() async {
    return authServices.signInWithGoogle();
  }

  signInWithGithub(context) {
    return authServices.signInWithGithub(context);
  }

  otpSetter(value) {
    otpcode = value;
    notifyListeners();
  }
}
