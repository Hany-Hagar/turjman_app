
import 'settings_title.dart';
import 'package:flutter/material.dart';
import '../../manager/settings_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../models/language_model.dart';
import 'package:country_flags/country_flags.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppLanguageBody extends StatelessWidget {
  const AppLanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsTitle(
            title: s.languages,
            color: Theme.of(context).primaryColor,
          ),
          CustomText(
            text: s.languagesSubtitle,
            size: 14.sp,
            type: Type.header,
            opacity: FontOpacity.overLow,
          ),
          SizedBox(height: 15.h),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: languages(context).length,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              return _LangItem(language: languages(context)[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _LangItem extends StatelessWidget {
  final LanguageModel language;
  const _LangItem({required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50.h,
      onTap: () => SettingsCubit.get(context).updateLanguage(language),
      tileColor: Theme.of(context).cardColor,
      leading: _Leading(countryCode: language.flagCountryCode),
      title: CustomText(
        text: language.name,
        size: 16.sp,
        type: Type.overMedium,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      subtitle: CustomText(
        text: S.of(context).languageItemSubtitle,
        size: 12.sp,
        type: Type.header,
        opacity: FontOpacity.overLow,
      ),
      trailing: _Trailing(
        isSelected:
            SettingsCubit.get(context).state.langIndex == language.index,
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  final String countryCode;
  const _Leading({required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCountryCode(
      countryCode,
      theme: ImageTheme(width: 45.w, height: 30.h, shape: Rectangle()),
    );
  }
}

class _Trailing extends StatelessWidget {
  final bool isSelected;

  const _Trailing({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? color : Colors.transparent,
        border: Border.all(
          color: isSelected ? color : Colors.grey,
          width: 2.5.w,
        ),
      ),
      child: isSelected
          ? Icon(Icons.check_rounded, size: 16.sp, color: Colors.white)
          : null,
    );
  }
}
