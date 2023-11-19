import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/firebase_options.dart';
import 'package:listify/presentation/widgets/listify_stream_builder.dart';
import 'package:provider/provider.dart';

bool shouldUseFirestoreEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider<AuthService>(
      create: (_) => AuthService(),
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
        home: ListifyStreamBuilder(),
      ),
    ),
  );
}
