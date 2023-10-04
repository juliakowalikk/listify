import 'package:flutter/material.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
          )
        ],
      );
}
