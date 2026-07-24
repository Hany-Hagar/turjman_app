import 'app_card.dart';
import 'theme_item.dart';
import 'settings_item.dart';
import 'settings_title.dart';
import 'package:flutter/material.dart';
import '../views/app_language_view.dart';
import '../../manager/settings_cubit.dart';
import '../../../models/app_user_pref.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../offline_languages/presentation/pages/views/offline_languages_view.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = SettingsCubit.get(context);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTitle(title: s.personalization),
        const ThemeItem(),
        SettingsItem(
          icon: IconBroken.Swap,
          title: s.languageTitle,
          iconColor: Colors.purple,
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
        BlocBuilder<SettingsCubit, AppUserPref>(
          builder: (context, state) => SettingsItem(
            icon: Icons.wifi,
            isSwitch: true,
            iconColor: Colors.orange,
            title: s.downloadFrowWifiOnlyTitle,
            subtitle: s.downloadFrowWifiOnlySubtitle,
            switchValue: cubit.state.downloadOverWiFiOnly,
            onSwitchChanged: (value) => cubit.toggleDownloadOverWiFiOnly(),
          ),
        ),
        Spacer(),
        AppCard(
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
