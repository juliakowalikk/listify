import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/presentation/pages/registration/cubit/registration_cubit.dart';
import 'package:listify/presentation/pages/registration/widgets/register_sign_in_now.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

import '../list/list_page.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RegistrationCubit(context.read<AuthService>()),
        child: Builder(
          builder: (context) => ScaffoldMessenger(
            child: BlocListener<RegistrationCubit, RegistrationState>(
              listener: _listener,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Welcome to Listify!',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                          const Text('Register to create your account'),
                          UserTextField(
                            controller: nameController,
                            hintText: 'Name',
                            isTextVisible: false,
                          ),
                          UserTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            controller: emailController,
                            hintText: 'Email address',
                            isTextVisible: false,
                          ),
                          UserTextField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 letters long';
                              }
                              return null;
                            },
                            controller: passwordController,
                            hintText: 'Password',
                            isTextVisible: true,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade800),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<RegistrationCubit>().register(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    nameController.text);
                              }
                            },
                            child: const Text(
                              'Sign Up',
                            ),
                          ),
                          const RegisterSignInNow(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _listener(BuildContext context, RegistrationState state) =>
      state.maybeWhen(
        successRegistration: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ListPage())),
        error: () => showErrorSnackBar(context, 'Something went wrong'),
        orElse: () => null,
      );

  showErrorSnackBar(BuildContext context, String errorText) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue.shade900,
          content: Text(errorText),
        ),
      );
}
