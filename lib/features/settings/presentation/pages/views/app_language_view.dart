import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/app_language_body.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class AppLanguageView extends StatelessWidget {
  const AppLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(top: const _Top(), body: const SingleChildScrollView(
      child: AppLanguageBody()
    ));
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomAppBar(
      title: s.appLanguage,
      subTitle: s.appLanguageSubtitle,
    );
  }
}
