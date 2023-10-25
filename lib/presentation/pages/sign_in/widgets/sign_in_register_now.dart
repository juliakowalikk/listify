import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listify/presentation/pages/registration/registration_page.dart';

class SignInRegisterNow extends StatelessWidget {
  const SignInRegisterNow({super.key});

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
                text: 'Not a member?', style: TextStyle(color: Colors.black)),
            TextSpan(
                text: ' Register now',
                style: const TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registration()))),
          ],
        ),
      );
}
