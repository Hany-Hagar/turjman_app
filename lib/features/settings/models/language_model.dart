
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';

class LanguageModel {
  final int index;
  final String name;
  final String code;
  final String flagCountryCode;

  LanguageModel({
    required this.index,
    required this.name,
    required this.code,
    required this.flagCountryCode,
  });
}

List<LanguageModel> languages (BuildContext context)=> [
  LanguageModel(index: 0, name: S.of(context).english, code: 'en', flagCountryCode: 'US'),
  LanguageModel(index: 1, name: S.of(context).arabic, code: 'ar', flagCountryCode: 'EG'),
];
