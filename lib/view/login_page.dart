import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/img_tile.dart';
import 'package:chat_app/components/text_form.dart';
import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/view/mobile_no_screen.dart';
import 'package:chat_app/view/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required void Function() onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutheProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/login.json',
                          height: 143,
                          width: 143,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        TextForm(
                          hinttext: 'Username',
                          obscureText: true,
                          controller: provider.usernameController,
                        ),
                        TextForm(
                          hinttext: 'Password',
                          obscureText: true,
                          controller: provider.passwordController,
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        ButtonPage(
                          text: "sign",
                          onTap: () async {
                            String username =
                                provider.usernameController.text.trim();
                            String password =
                                provider.passwordController.text.trim();

                            if (username.isEmpty || password.isEmpty) {
                              // Show an alert if email or password is not typed properly
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Incomplete Information'),
                                    content: const Text(
                                        'Please enter both username and password.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              try {
                                UserCredential userCredential =
                                    await provider.signInWithEmailandPassword(
                                        username, password);

                                // User exists, clear controllers
                                provider.passwordController.clear();
                                provider.usernameController.clear();
                              } catch (e) {
                                // Show an alert that the user does not exist
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('User Not Found'),
                                      content: const Text(
                                          'The entered username or password is incorrect.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: provider.signInWithGoogle,
                                child: const ImgTile(
                                    imagePath: "assets/google.jpg")),
                            const SizedBox(width: 10),
                            GestureDetector(
                                onTap: () {
                                  provider.signInWithGithub(context);
                                },
                                child: const ImgTile(
                                    imagePath: "assets/github.jpg")),
                            const SizedBox(width: 10),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const MobileNumberScreen(),
                                  ));
                                },
                                child:
                                    const ImgTile(imagePath: "assets/otp.jpg")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    provider.usernameController.clear();
                                    provider.passwordController.clear();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage(onTap: () {}),
                                        ));
                                  },
                                  child: const Text(
                                    "Create one",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
