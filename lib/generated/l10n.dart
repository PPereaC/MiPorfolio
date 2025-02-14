// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Available`
  String get availableToWork {
    return Intl.message(
      'Available',
      name: 'availableToWork',
      desc: '',
      args: [],
    );
  }

  /// `Software Developer`
  String get occupation {
    return Intl.message(
      'Software Developer',
      name: 'occupation',
      desc: '',
      args: [],
    );
  }

  /// `As a `
  String get introduction_como {
    return Intl.message('As a ', name: 'introduction_como', desc: '', args: []);
  }

  /// `software developer `
  String get introduction_desarrollador {
    return Intl.message(
      'software developer ',
      name: 'introduction_desarrollador',
      desc: '',
      args: [],
    );
  }

  /// `my passion is to create `
  String get introduction_pasion {
    return Intl.message(
      'my passion is to create ',
      name: 'introduction_pasion',
      desc: '',
      args: [],
    );
  }

  /// `innovative applications `
  String get introduction_aplicaciones {
    return Intl.message(
      'innovative applications ',
      name: 'introduction_aplicaciones',
      desc: '',
      args: [],
    );
  }

  /// `that make a difference.\nMy experience in `
  String get introduction_diferencia {
    return Intl.message(
      'that make a difference.\nMy experience in ',
      name: 'introduction_diferencia',
      desc: '',
      args: [],
    );
  }

  /// `cross-platform development `
  String get introduction_multiplataforma {
    return Intl.message(
      'cross-platform development ',
      name: 'introduction_multiplataforma',
      desc: '',
      args: [],
    );
  }

  /// `allows me to create complete solutions. I am a `
  String get introduction_soluciones {
    return Intl.message(
      'allows me to create complete solutions. I am a ',
      name: 'introduction_soluciones',
      desc: '',
      args: [],
    );
  }

  /// `curious and proactive person, `
  String get introduction_curiosa {
    return Intl.message(
      'curious and proactive person, ',
      name: 'introduction_curiosa',
      desc: '',
      args: [],
    );
  }

  /// `always looking for `
  String get introduction_buscando {
    return Intl.message(
      'always looking for ',
      name: 'introduction_buscando',
      desc: '',
      args: [],
    );
  }

  /// `new challenges `
  String get introduction_desafios {
    return Intl.message(
      'new challenges ',
      name: 'introduction_desafios',
      desc: '',
      args: [],
    );
  }

  /// `that allow me to continue growing in the world of development.`
  String get introduction_creciendo {
    return Intl.message(
      'that allow me to continue growing in the world of development.',
      name: 'introduction_creciendo',
      desc: '',
      args: [],
    );
  }

  /// `Switch to dark mode`
  String get toggleToDarkMode {
    return Intl.message(
      'Switch to dark mode',
      name: 'toggleToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch to light mode`
  String get toggleToLightMode {
    return Intl.message(
      'Switch to light mode',
      name: 'toggleToLightMode',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeSection {
    return Intl.message('Home', name: 'homeSection', desc: '', args: []);
  }

  /// `Projects`
  String get projectsSection {
    return Intl.message(
      'Projects',
      name: 'projectsSection',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experienceSection {
    return Intl.message(
      'Experience',
      name: 'experienceSection',
      desc: '',
      args: [],
    );
  }

  /// `Technologies`
  String get technologiesSection {
    return Intl.message(
      'Technologies',
      name: 'technologiesSection',
      desc: '',
      args: [],
    );
  }

  /// `Training`
  String get trainingSection {
    return Intl.message(
      'Training',
      name: 'trainingSection',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get projectsSectionLabelP1 {
    return Intl.message(
      'My',
      name: 'projectsSectionLabelP1',
      desc: '',
      args: [],
    );
  }

  /// `projects`
  String get projectsSectionLabelP2 {
    return Intl.message(
      'projects',
      name: 'projectsSectionLabelP2',
      desc: '',
      args: [],
    );
  }

  /// `Here you can see some of the projects I have worked on`
  String get projectsSectionDescription {
    return Intl.message(
      'Here you can see some of the projects I have worked on',
      name: 'projectsSectionDescription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
