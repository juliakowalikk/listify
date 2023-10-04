import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isTextVisible;
  const UserTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isTextVisible});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: isTextVisible,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(),
              ),
              controller: controller,
            ),
          ),
        ],
      );
}
