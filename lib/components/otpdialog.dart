import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

void showOtpDialoge({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Enter OTP'),
      content: Column(
        children: <Widget>[
          const Image(
            image: AssetImage(""),
          ),
          TextField(
            controller: codeController,
            decoration:
                const InputDecoration(labelText: 'OTP', hintText: 'Enter OTP'),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(onPressed: onPressed, child: const Text('Done'))
      ],
    ),
  );
}

class CustomAlertDialog extends StatelessWidget {
  final String verificationId;
  CustomAlertDialog({
    super.key,
    required this.verificationId,
  });
  final TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.teal,
      content: Image(
        image: AssetImage(''),
      ),
      actions: [
        Pinput(
          length: 6,
          showCursor: true,
          defaultPinTheme: PinTheme(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.pink),
            ),
          ),
        )
      ],
    );
  }
}
