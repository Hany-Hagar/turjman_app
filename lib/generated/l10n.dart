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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Turjuman`
  String get appTitle {
    return Intl.message(
      'Turjuman',
      name: 'appTitle',
      desc: 'The application title',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get onBoardingButton1 {
    return Intl.message(
      'Let\'s Get Started',
      name: 'onBoardingButton1',
      desc: 'The title of the first onboarding button',
      args: [],
    );
  }

  /// `Next`
  String get onBoardingButton2 {
    return Intl.message(
      'Next',
      name: 'onBoardingButton2',
      desc: 'The title of the second onboarding button',
      args: [],
    );
  }

  /// `Next`
  String get onBoardingButton3 {
    return Intl.message(
      'Next',
      name: 'onBoardingButton3',
      desc: 'The title of the third onboarding button',
      args: [],
    );
  }

  /// `Start Translating`
  String get onBoardingButton4 {
    return Intl.message(
      'Start Translating',
      name: 'onBoardingButton4',
      desc: 'The title of the fourth onboarding button',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message(
      'Source',
      name: 'source',
      desc: 'The source language label',
      args: [],
    );
  }

  /// `Type something to translate`
  String get sourceTextHint {
    return Intl.message(
      'Type something to translate',
      name: 'sourceTextHint',
      desc: 'The hint text for the source text field',
      args: [],
    );
  }

  /// `Translation`
  String get translation {
    return Intl.message(
      'Translation',
      name: 'translation',
      desc: 'The translation label',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: 'The image label',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: 'The camera label',
      args: [],
    );
  }

  /// `Voice`
  String get voice {
    return Intl.message(
      'Voice',
      name: 'voice',
      desc: 'The voice label',
      args: [],
    );
  }

  /// `Recent Translations`
  String get recentTranslations {
    return Intl.message(
      'Recent Translations',
      name: 'recentTranslations',
      desc: 'The recent translations label',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: 'The view all label',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
