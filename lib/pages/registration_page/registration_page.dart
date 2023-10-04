import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:listify/pages/list_page/list_page.dart';
import 'package:listify/pages/login_page/login_page.dart';
import 'package:listify/pages/user_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Listify!',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                const Text('Register to create your account'),
                UserTextField(
                  controller: nameController,
                  hintText: 'Name',
                  isTextVisible: false,
                ),
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
                      MaterialPageRoute(builder: (context) => const ListPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Are you already a user?',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: ' Log in now!',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
