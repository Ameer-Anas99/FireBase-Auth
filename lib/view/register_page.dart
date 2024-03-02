import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                // welcome messsage

                const Text(
                  "Lets create an account for you",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),

                // email textfield

                TextFieldPage(
                    controller: emailTextController,
                    hintText: "Email",
                    obsureText: false),

                const SizedBox(
                  height: 10,
                ),

                //  password textfield

                TextFieldPage(
                    controller: passwordTextController,
                    hintText: "Password",
                    obsureText: true),

                const SizedBox(
                  height: 15,
                ),

                TextFieldPage(
                    controller: passwordTextController,
                    hintText: "Conform Password",
                    obsureText: true),

                const SizedBox(
                  height: 15,
                ),

                // Sign in button

                ButtonPage(onTap: () {}, text: "Sign up"),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
