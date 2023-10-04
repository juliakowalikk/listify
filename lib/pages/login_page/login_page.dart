import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listify/pages/list_page/list_page.dart';
import 'package:listify/pages/user_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome back to Listify!',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              const Text('Enter your credential to access your account'),
              UserTextField(
                controller: emailController,
                hintText: 'Email address',
                isTextVisible: false,
              ),
              UserTextField(
                controller: passwordController,
                hintText: 'Password',
                isTextVisible: true,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListPage()));
                },
                child: const Text('Login'),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Not a member?',
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: ' Register now',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pop(context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
