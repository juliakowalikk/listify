import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubits/list_cubit.dart';
import 'pages/list_page/list_page.dart';

void main() => runApp(
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
          home: ListPage(),
        ),
      ),
    );
