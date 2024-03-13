import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_form.dart';
import 'package:chat_app/controller/auth_provider.dart';
import 'package:chat_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, required void Function() onTap}) : super(key: key);

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
                              '',
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

                            // Check if the password and confirmation password match
                            if (value.passwordController.text ==
                                value.conformpasswordController.text) {
                              try {
                                // If they match, call the RegisterPageWithEmailandPassword method
                                (
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
                                      builder: (context) => HomePage()),
                                );
                              } catch (e) {
                                // Handle any errors that occur during account creation
                                print("Error creating account: $e");
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
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
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
