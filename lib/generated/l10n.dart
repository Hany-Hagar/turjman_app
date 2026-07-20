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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Copied to clipboard`
  String get copySuccess {
    return Intl.message(
      'Copied to clipboard',
      name: 'copySuccess',
      desc: 'The message displayed when text is copied to the clipboard',
      args: [],
    );
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

  /// `Turjuman`
  String get homeTitle {
    return Intl.message(
      'Turjuman',
      name: 'homeTitle',
      desc: 'The title of the home page',
      args: [],
    );
  }

  /// `The best translation app for your needs`
  String get homeSubtitle {
    return Intl.message(
      'The best translation app for your needs',
      name: 'homeSubtitle',
      desc: 'The subtitle of the home page',
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

  /// `Translations`
  String get translations {
    return Intl.message(
      'Translations',
      name: 'translations',
      desc: 'The translations label',
      args: [],
    );
  }

  /// `No translations available`
  String get emptyTranslations {
    return Intl.message(
      'No translations available',
      name: 'emptyTranslations',
      desc: 'The message displayed when there are no translations available',
      args: [],
    );
  }

  /// `Source`
  String get sourceTitle {
    return Intl.message(
      'Source',
      name: 'sourceTitle',
      desc: 'The title for the source language',
      args: [],
    );
  }

  /// `Translation`
  String get translationTitle {
    return Intl.message(
      'Translation',
      name: 'translationTitle',
      desc: 'The title for the translation',
      args: [],
    );
  }

  /// `Image to Text`
  String get imageTitle {
    return Intl.message(
      'Image to Text',
      name: 'imageTitle',
      desc: 'The title for the image',
      args: [],
    );
  }

  /// `Select an image to extract text from`
  String get imageSubtitle {
    return Intl.message(
      'Select an image to extract text from',
      name: 'imageSubtitle',
      desc: 'The subtitle for the image',
      args: [],
    );
  }

  /// `Select an image`
  String get selectAnImage {
    return Intl.message(
      'Select an image',
      name: 'selectAnImage',
      desc: 'The label for selecting an image',
      args: [],
    );
  }

  /// `Choose an image from your gallery\nor capture a new one to extract text.`
  String get selectAnImageHint {
    return Intl.message(
      'Choose an image from your gallery\nor capture a new one to extract text.',
      name: 'selectAnImageHint',
      desc: 'The hint text for selecting an image',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: 'The label for choosing an image from the gallery',
      args: [],
    );
  }

  /// `Capture with Camera`
  String get captureWithCamera {
    return Intl.message(
      'Capture with Camera',
      name: 'captureWithCamera',
      desc: 'The label for capturing an image with the camera',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: 'The label for \'or\' between two options',
      args: [],
    );
  }

  /// `Supported formats: JPG, PNG, GIF`
  String get supportedFormats {
    return Intl.message(
      'Supported formats: JPG, PNG, GIF',
      name: 'supportedFormats',
      desc: 'The label for supported image formats',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: 'The title for the settings page',
      args: [],
    );
  }

  /// `Customize your app experience`
  String get settingsSubtitle {
    return Intl.message(
      'Customize your app experience',
      name: 'settingsSubtitle',
      desc: 'The subtitle for the settings page',
      args: [],
    );
  }

  /// `Personalization`
  String get personalization {
    return Intl.message(
      'Personalization',
      name: 'personalization',
      desc: 'The label for personalization section',
      args: [],
    );
  }

  /// `Theme`
  String get themeTitle {
    return Intl.message(
      'Theme',
      name: 'themeTitle',
      desc: 'The title for the theme',
      args: [],
    );
  }

  /// `Choose between light, dark, or system default`
  String get themeSubtitle {
    return Intl.message(
      'Choose between light, dark, or system default',
      name: 'themeSubtitle',
      desc: 'The subtitle for the theme',
      args: [],
    );
  }

  /// `Light`
  String get themeLight {
    return Intl.message(
      'Light',
      name: 'themeLight',
      desc: 'The label for the light theme',
      args: [],
    );
  }

  /// `Dark`
  String get themeDark {
    return Intl.message(
      'Dark',
      name: 'themeDark',
      desc: 'The label for the dark theme',
      args: [],
    );
  }

  /// `System`
  String get themeSystem {
    return Intl.message(
      'System',
      name: 'themeSystem',
      desc: 'The label for the system default theme',
      args: [],
    );
  }

  /// `Language`
  String get languageTitle {
    return Intl.message(
      'Language',
      name: 'languageTitle',
      desc: 'The title for the language',
      args: [],
    );
  }

  /// `Select your preferred language for the app`
  String get languageSubtitle {
    return Intl.message(
      'Select your preferred language for the app',
      name: 'languageSubtitle',
      desc: 'The subtitle for the language',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: 'The title for the app language',
      args: [],
    );
  }

  /// `Select your preferred language for the app`
  String get appLanguageSubtitle {
    return Intl.message(
      'Select your preferred language for the app',
      name: 'appLanguageSubtitle',
      desc: 'The subtitle for the app language',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: 'The label for languages',
      args: [],
    );
  }

  /// `Select your preferred language for the app`
  String get languagesSubtitle {
    return Intl.message(
      'Select your preferred language for the app',
      name: 'languagesSubtitle',
      desc: 'The subtitle for languages',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'The label for English language',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: 'The label for Arabic language',
      args: [],
    );
  }

  /// `Tap to change the app language`
  String get languageItemSubtitle {
    return Intl.message(
      'Tap to change the app language',
      name: 'languageItemSubtitle',
      desc: 'The subtitle for the language item',
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
