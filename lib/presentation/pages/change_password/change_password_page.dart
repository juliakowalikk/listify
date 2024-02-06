import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';
import 'package:listify/style/text_style.dart';

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
        child: Builder(
            builder: (context) =>
                BlocListener<ChangePasswordCubit, ChangePasswordState>(
                  listener: _listener,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text(
                        Strings.of(context).changePasswordText,
                        style: AppTextStyle.text2,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    body: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Strings.of(context).changePasswordInfo,
                            style: AppTextStyle.text1,
                          ),
                          UserTextField(
                              controller: oldPasswordController,
                              hintText: Strings.of(context).oldPasswordText,
                              isTextVisible: false),
                          UserTextField(
                              controller: newPasswordController,
                              hintText: Strings.of(context).newPassword,
                              isTextVisible: false),
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(
                                      color: Colors.deepPurpleAccent),
                                ),
                              ),
                            ),
                            onPressed: () => context
                                .read<ChangePasswordCubit>()
                                .changeUserPassword(
                                  email: context
                                      .read<AuthService>()
                                      .firebaseAuth
                                      .currentUser
                                      ?.email,
                                  newPassword: newPasswordController.text,
                                  oldPassword: oldPasswordController.text,
                                ),
                            child: Text(Strings.of(context).changePasswordText),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      );
  void _listener(BuildContext context, ChangePasswordState state) =>
      state.maybeWhen(
          successChangePassword: () {
            oldPasswordController.clear();
            newPasswordController.clear();
            return showInfoSnackBar(
                context, Strings.of(context).changePasswordSuccess);
          },
          error: () => showInfoSnackBar(context, Strings.of(context).error),
          orElse: () => null);

  showInfoSnackBar(BuildContext context, String errorText) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue.shade900,
          content: Text(errorText),
        ),
      );
}
