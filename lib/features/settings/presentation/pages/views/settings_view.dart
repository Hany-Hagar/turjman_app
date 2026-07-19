import 'package:flutter/material.dart';
import '../widgets/settings_body.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: _Top(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: const SettingsBody()
      )
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Settings",
      subTitle: "Manage your preferences and app settings",
    );
  }
}