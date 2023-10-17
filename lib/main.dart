import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listify/presentation/pages/list/cubit/list_cubit.dart';
import 'package:listify/presentation/pages/sign_in/sign_in_page.dart';

import 'firebase_options.dart';

bool shouldUseFirestoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  runApp(
    BlocProvider(
      create: (context) => ListCubit(),
      child: const MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          Strings.delegate
        ],
        supportedLocales: [
          Locale('en'),
        ],
        home: SignIn(),
      ),
    ),
  );
}
