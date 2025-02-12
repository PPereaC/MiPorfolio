import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:miporfolio/config/theme/app_theme.dart';
import 'package:miporfolio/presentation/views/home_view.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // Verifica si el idioma del dispositivo está soportado
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return locale;
          }
        }
        // Si no está soportado, retorna inglés como idioma por defecto
        return const Locale('en');
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const HomeView(),
    );
  }
}