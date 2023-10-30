import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listify/presentation/pages/sign_in/sign_in_page.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
              ),
              child: const Center(child: Text('Listify')),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      ),
                    );
              },
            ),
          ],
        ),
      );
}
