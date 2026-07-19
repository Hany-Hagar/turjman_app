import 'package:flutter/material.dart';

class AppUserPref {
  final String lang;
  final int langIndex;
  final ThemeMode theme;
  final bool isFirstTime;
  final bool notificationsEnabled;
  final String sourceLanguage;
  final String targetLanguage;
  AppUserPref({
    required this.lang,
    required this.langIndex,
    required this.theme,
    required this.isFirstTime,
    required this.notificationsEnabled,
    required this.sourceLanguage,
    required this.targetLanguage,
  });

  factory AppUserPref.standard() {
    return AppUserPref(
      lang: "en",
      langIndex: 0,
      isFirstTime: true,
      theme: ThemeMode.light,
      notificationsEnabled: true,
      sourceLanguage: "english",
      targetLanguage: "arabic"
    );
  }

  AppUserPref copyWith({
    String? lang,
    int? langIndex,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? notificationsEnabled,
    bool? vibrationEnabled,
    String? sourceLanguage,
    String? targetLanguage,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      langIndex: langIndex ?? this.langIndex,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      targetLanguage: targetLanguage ?? this.targetLanguage,
    );
  }

  factory AppUserPref.fromJson(Map<String, dynamic> json) {
    return AppUserPref(
      lang: json['lang'] as String,
      langIndex: json['langIndex'] as int? ?? 0,
      theme: ThemeMode.values[json['theme'] as int],
      isFirstTime: json['isFirstTime'] as bool? ?? true,
      targetLanguage: json['targetLanguage'] as String? ?? "arabic",
      sourceLanguage: json['sourceLanguage'] as String? ?? "english",
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'langIndex': langIndex,
      'theme': theme.index,
      'isFirstTime': isFirstTime,
      'notificationsEnabled': notificationsEnabled,
      'sourceLanguage': sourceLanguage,
      'targetLanguage': targetLanguage,
    };
  }
}
