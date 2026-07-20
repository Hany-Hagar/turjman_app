import '../../../../offline_languages/presentation/pages/views/offline_languages_view.dart';
import 'theme_item.dart';
import 'settings_item.dart';
import 'settings_title.dart';
import 'package:flutter/material.dart';
import '../views/app_language_view.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTitle(title: s.personalization),
        const ThemeItem(),
        SettingsItem(
          icon: IconBroken.Swap,
          iconColor: Colors.blue,
          title: s.languageTitle,
          subtitle: s.languageSubtitle,
          navigationPage: const AppLanguageView(),
        ),
        SettingsTitle(title: s.dataAndStorage),
        SettingsItem(
          icon: IconBroken.Download,
          iconColor: Colors.green,
          title: s.offlineLanguagesTitle,
          subtitle: s.offlineLanguagesSubtitle,
          navigationPage: const OfflineLanguagesView(),
        ),
      ],
    );
  }
}
