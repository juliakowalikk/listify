import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listify/presentation/pages/sign_in/sign_in_page.dart';

class RegisterSignInNow extends StatelessWidget {
  const RegisterSignInNow({super.key});

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: <TextSpan>[
            const TextSpan(
              text: 'Are you already a user?',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: ' Log in now!',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    ),
            ),
          ],
        ),
      );
}
