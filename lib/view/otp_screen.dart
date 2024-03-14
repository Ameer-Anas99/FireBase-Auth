import 'dart:developer';
import 'package:chat_app/components/button.dart';
import 'package:chat_app/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Lottie.asset("assets/successotp.json")),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Verification',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter the OTP sent to your phone',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    cursorColor: Colors.green,
                    controller: otpController,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Enter the phone number',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 36, 102, 38))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonPage(
                      onTap: () async {
                        if (otpController.text.isNotEmpty) {
                          try {
                            PhoneAuthCredential credential =
                                await PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otpController.text.toString());
                            await FirebaseAuth.instance
                                .signInWithCredential(credential);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                                (route) => false);
                          } catch (e) {
                            log(e.toString());
                          }
                        } else {
                          log('Otp is empty');
                        }
                      },
                      text: 'Verify'),
                  const SizedBox(height: 20),
                  const Text(
                    'Did\'t receive any code?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Resent new code',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
