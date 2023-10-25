import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listify/presentation/pages/list/list_page.dart';
import 'package:listify/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:listify/presentation/pages/sign_in/widgets/sign_in_register_now.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: Builder(
          builder: (context) => ScaffoldMessenger(
            child: BlocListener<LoginCubit, LoginState>(
              listener: _listener,
              child: Scaffold(
                body: SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome back to Listify!',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        const Text(
                            'Enter your credential to access your account'),
                        UserTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Write correct email';
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
                              return 'Please enter some text';
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
                              context.read<LoginCubit>().signIn(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: const Text('Login'),
                        ),
                        const SignInRegisterNow()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _listener(BuildContext context, LoginState state) => state.maybeWhen(
        goToList: () {
          emailController.clear();
          passwordController.clear();
          return Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ListPage()));
        },
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
