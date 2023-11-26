import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

import 'cubit/change_password_cubit.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ChangePasswordCubit(context.read<AuthService>()),
        child: Builder(builder: (context) {
          return BlocListener<ChangePasswordCubit, ChangePasswordState>(
            listener: _listener,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Text('user name'),
                    Text('Change password'),
                    Text(
                        'Your password must be at least six characters \n and can include special characters'),
                    UserTextField(
                        controller: oldPasswordController,
                        hintText: 'Retype your old password',
                        isTextVisible: false),
                    UserTextField(
                        controller: newPasswordController,
                        hintText: 'New password',
                        isTextVisible: false),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ChangePasswordCubit>().changeUserPassword(
                              email: context
                                  .read<AuthService>()
                                  .firebaseAuth
                                  .currentUser
                                  ?.email,
                              newPassword: newPasswordController.text,
                              oldPassword: oldPasswordController.text,
                            );
                        print('password changes');
                      },
                      child: Text('Change password'),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
  void _listener(BuildContext context, ChangePasswordState state) =>
      state.maybeWhen(
        successChangePassword: () => print('success'),
        orElse: () => null,
      );
}
