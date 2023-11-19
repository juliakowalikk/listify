import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/pages/list/list_page.dart';
import 'package:listify/presentation/pages/sign_in/sign_in_page.dart';
import 'package:provider/provider.dart';

class ListifyStreamBuilder extends StatelessWidget {
  const ListifyStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
        stream: context.read<AuthService>().onAuthStateChanged,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return const ListPage();
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Text(
                snapshot.error.toString(),
              ),
            );
          }
          return const SignIn();
        },
      );
}
