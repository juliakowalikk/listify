import 'package:flutter/material.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text('user name'),
              Text('Change password'),
              Text(
                  'Your password must be at least six characters \n and can include special characters'),
              UserTextField(
                  controller: newPasswordController,
                  hintText: 'New password',
                  isTextVisible: false),
              UserTextField(
                  controller: newPasswordController,
                  hintText: 'Retype new password',
                  isTextVisible: false),
              ElevatedButton(
                onPressed: () {},
                child: Text('Change password'),
              )
            ],
          ),
        ),
      );
}
