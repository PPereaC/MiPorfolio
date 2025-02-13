import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miporfolio/config/theme/app_theme.dart';
import 'package:miporfolio/presentation/views/home_view.dart';

import 'generated/l10n.dart';
import 'presentation/providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(themeNotifierProvider);
    final language = ref.watch(languageProvider);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
      locale: language,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: appTheme.isDarkMode).getTheme(),
      home: const HomeView(),
    );
  }
}