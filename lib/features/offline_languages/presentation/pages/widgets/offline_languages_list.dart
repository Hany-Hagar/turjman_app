import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:turjman_app/core/widgets/custom_list.dart';
import '../../../../../core/mapping/language_to_country.dart';
import '../../../../../generated/l10n.dart';
import 'package:country_flags/country_flags.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class OfflineLanguagesList extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isFailure;
  final List<TranslateLanguage> languages;
  const OfflineLanguagesList({
    super.key,
    required this.title,
    required this.isLoading,
    required this.isFailure,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            size: 14.sp,
            type: Type.header,
            opacity: FontOpacity.overLow,
          ),
          CustomList(
            items: languages,
            isLoading: isLoading,
            isFailure: isFailure,
            padding: EdgeInsets.zero,
            itemBuilder: (p0, p1) => _LangItem(language: p1),
            scrollPhysics: const NeverScrollableScrollPhysics(),
            emptyItems: List.generate(5, (index) => TranslateLanguage.arabic),
          ),
        ],
      ),
    );
  }
}

class _LangItem extends StatelessWidget {
  final TranslateLanguage language;
  const _LangItem({required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50.h,
      tileColor: Theme.of(context).cardColor,
      leading: _Leading(countryCode: languageToCountry[language.name] ?? "US"),
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
