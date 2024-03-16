import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_form.dart';
import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    Key? key,
    required void Function() onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const SizedBox(width: 100),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/register.json',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Consumer<AutheProvider>(
                  builder: (context, value, child) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextForm(
                          hinttext: 'Gmail',
                          obscureText: true,
                          controller: value.usernameController,
                        ),
                        TextForm(
                          hinttext: 'Password',
                          obscureText: true,
                          controller: value.passwordController,
                        ),
                        TextForm(
                          hinttext: 'Confirm Password',
                          obscureText: true,
                          controller: value.conformpasswordController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonPage(
                          text: "Register",
                          onTap: () async {
                            // Check if any field is empty
                            if (value.usernameController.text.isEmpty ||
                                value.passwordController.text.isEmpty ||
                                value.conformpasswordController.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "All fields must be filled out."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                              return;
                            }
                            if ((value.passwordController.text.length < 6)) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        "Password must be at least 6 characters long."),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Ok"))
                                    ],
                                  );
                                },
                              );
                              return;
                            }

                            // Check if the password and confirmation password match
                            if (value.passwordController.text ==
                                value.conformpasswordController.text) {
                              try {
                                // If they match, call the RegisterPageWithEmailandPassword method
                                await value.signUpWithEmailandPassword(
                                  value.usernameController.text,
                                  value.passwordController.text,
                                );
                                value.usernameController.clear();
                                value.passwordController.clear();
                                value.conformpasswordController.clear();

                                // Navigate to the home screen after successful account creation
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              } catch (e) {
                                if (e is FirebaseAuthException &&
                                    e.code == 'email-already-in-use') {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "The email is already in use."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'ok',
                                                style: TextStyle(fontSize: 22),
                                              )),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  // Handle any errors that occur during account creation
                                  print("Error creating account: $e");
                                }
                              }
                            } else {
                              // If passwords don't match, show an error message
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Error"),
                                    content:
                                        const Text("Passwords do not match."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          "OK",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonPage(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: "Back",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
