import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/pages/settings/settings_page.dart';
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
              child: const Center(
                child: Text('Listify'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(Strings.of(context).settings),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(Strings.of(context).logOut),
              onTap: () => AuthService().firebaseAuth.signOut().then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    ),
                  ),
            ),
          ],
        ),
      );
}
