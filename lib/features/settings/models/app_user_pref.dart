import 'package:flutter/material.dart';

class AppUserPref {
  final String lang;
  final int langIndex;
  final ThemeMode theme;
  final bool isFirstTime;
  final String sourceLanguage;
  final String targetLanguage;
  final bool notificationsEnabled;
  final bool downloadOverWiFiOnly;
  AppUserPref({
    required this.lang,
    required this.langIndex,
    required this.theme,
    required this.isFirstTime,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.notificationsEnabled,
    required this.downloadOverWiFiOnly,
  });

  factory AppUserPref.standard() {
    return AppUserPref(
      lang: "en",
      langIndex: 0,
      isFirstTime: true,
      theme: ThemeMode.light,
      targetLanguage: "arabic",
      sourceLanguage: "english",
      notificationsEnabled: true,
      downloadOverWiFiOnly: true,
    );
  }

  AppUserPref copyWith({
    String? lang,
    int? langIndex,
    ThemeMode? theme,
    bool? isFirstTime,
    bool? vibrationEnabled,
    String? sourceLanguage,
    String? targetLanguage,
    bool? notificationsEnabled,
    bool? downloadOverWiFiOnly,
  }) {
    return AppUserPref(
      lang: lang ?? this.lang,
      theme: theme ?? this.theme,
      langIndex: langIndex ?? this.langIndex,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      sourceLanguage: sourceLanguage ?? this.sourceLanguage,
      targetLanguage: targetLanguage ?? this.targetLanguage,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      downloadOverWiFiOnly: downloadOverWiFiOnly ?? this.downloadOverWiFiOnly,
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
      downloadOverWiFiOnly: json['downloadOverWiFiOnly'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'langIndex': langIndex,
      'theme': theme.index,
      'isFirstTime': isFirstTime,
      'sourceLanguage': sourceLanguage,
      'targetLanguage': targetLanguage,
      'notificationsEnabled': notificationsEnabled,
      'downloadOverWiFiOnly': downloadOverWiFiOnly,
    };
  }
}
