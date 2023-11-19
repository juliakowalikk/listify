import 'package:flutter/material.dart';
import 'package:listify/presentation/pages/settings/widgets/setting_tile.dart';

class SettingsPage extends StatelessWidget {
  final String userName;

  const SettingsPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.white70,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SettingTile(
                  icon: Icons.person,
                  settingTileTitle: 'Name:',
                  settingTileSubtitle: userName,
                  settingTileHintText: 'Type your name',
                ),
                const SettingTile(
                  icon: Icons.lock,
                  settingTileTitle: 'Change your password',
                  settingTileSubtitle: '',
                  settingTileHintText: 'Type new password',
                ),
                const SettingTile(
                  settingTileTitle: 'Change your email',
                  icon: Icons.email,
                  settingTileSubtitle: '',
                  settingTileHintText: 'Type new email',
                )
              ],
            ),
          ),
        ),
      );
}
