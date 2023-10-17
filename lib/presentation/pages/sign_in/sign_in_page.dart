import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listify/presentation/pages/list/list_page.dart';
import 'package:listify/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:listify/presentation/widgets/listify_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignInState extends State<SignIn> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome back to Listify!',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Text('Enter your credential to access your account'),
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
                            .read<LoginCubit>()
                            .signIn(
                                emailController.text, passwordController.text)
                            .then(
                              (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListPage(),
                                ),
                              ),
                            );
                      },
                      child: const Text('Login'),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Not a member?',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: ' Register now',
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
}
