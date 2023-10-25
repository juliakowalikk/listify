import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listify/presentation/pages/list/list_page.dart';
import 'package:listify/presentation/pages/registration/cubit/registration_cubit.dart';
import 'package:listify/presentation/pages/sign_in/sign_in_page.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        controller: emailController,
                        hintText: 'Email address',
                        isTextVisible: false,
                      ),
                      UserTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        isTextVisible: true,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade800),
                        onPressed: () {
                          context
                              .read<RegistrationCubit>()
                              .register(emailController.text.trim(),
                                  passwordController.text.trim())
                              .then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ListPage(),
                                  ),
                                ),
                              )
                              .onError(
                                  (error, stackTrace) => print('error $error'));
                        },
                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Are you already a user?',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: ' Log in now!',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
}
