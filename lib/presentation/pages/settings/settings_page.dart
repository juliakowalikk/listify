import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/pages/change_password/change_password_page.dart';
import 'package:listify/presentation/pages/settings/cubit/settings_cubit.dart';
import 'package:listify/presentation/pages/settings/widgets/setting_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController emailChangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final x = context.read<AuthService>().firebaseAuth.currentUser;
    var userEmail = x?.email;

    return BlocProvider(
      create: (context) => SettingsCubit(context.read<AuthService>()),
      child: Builder(
          builder: (context) => BlocListener<SettingsCubit, SettingsState>(
                listener: _listener,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(Strings.of(context).settings),
                    backgroundColor: Colors.white70,
                  ),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              Strings.of(context).profileTitle,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          SettingTile(
                            icon: Icons.lock,
                            settingTileTitle:
                                Strings.of(context).changePasswordText,
                            settingTileHintText:
                                Strings.of(context).changePasswordHintText,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePasswordPage())),
                          ),
                          SettingTile(
                            settingTileTitle: userEmail.toString(),
                            icon: Icons.email,
                            settingTileHintText:
                                Strings.of(context).changeEmailHintText,
                            onPressed: () => _showMyDialog(() {
                              context.read<SettingsCubit>().changeUserEmail(
                                    newEmail: emailChangeController.text,
                                  );
                              emailChangeController.clear();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  Future<void> _showMyDialog(Function() onPressed) async => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) => AlertDialog(
            title: const Text('Change email'),
            content: TextField(
              controller: emailChangeController,
              decoration: const InputDecoration(
                hintText: 'New email',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () => onPressed(),
                child: const Text('Change'),
              )
            ],
          ));
  void _listener(BuildContext context, SettingsState state) => state.maybeWhen(
        emailChanged: () => print('success'),
        orElse: () => null,
      );
}
