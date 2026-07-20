import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:country_flags/country_flags.dart';
import '../../manager/offline_languages_cubit.dart';
import '../../manager/offline_languages_states.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:turjman_app/core/widgets/custom_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/mapping/language_to_country.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class OfflineLanguagesList extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isFailure;
  final bool isDownloaded;
  final List<TranslateLanguage> languages;
  const OfflineLanguagesList({
    super.key,
    required this.title,
    required this.isLoading,
    required this.isFailure,
    required this.languages,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: title, size: 18.sp, type: Type.header),
          CustomList(
            items: languages,
            isLoading: isLoading,
            isFailure: isFailure,
            padding: EdgeInsets.zero,
            itemBuilder: (p0, p1) =>
                _LangItem(isDownloaded: isDownloaded, language: p1),
            scrollPhysics: const NeverScrollableScrollPhysics(),
            emptyItems: List.generate(5, (index) => TranslateLanguage.arabic),
          ),
        ],
      ),
    );
  }
}

class _LangItem extends StatelessWidget {
  final bool isDownloaded;
  final TranslateLanguage language;
  const _LangItem({required this.isDownloaded, required this.language});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 50.h,
      tileColor: Theme.of(context).cardColor,
      title: _TitleItem(name: language.name),
      leading: _LeadingItem(name: language.name),
      trailing: _Trailing(isDownloaded: isDownloaded, language: language),
      subtitle: _SubTitleItem(subtitle: S.of(context).languageItemSubtitle),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    );
  }
}

class _LeadingItem extends StatelessWidget {
  final String name;
  const _LeadingItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCountryCode(
      languageToCountry[name] ?? "US",
      theme: ImageTheme(width: 45.w, height: 30.h, shape: Rectangle()),
    );
  }
}

class _TitleItem extends StatelessWidget {
  final String name;
  const _TitleItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: name, size: 16.sp, type: Type.overMedium);
  }
}

class _SubTitleItem extends StatelessWidget {
  final String subtitle;
  const _SubTitleItem({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: subtitle,
      size: 12.sp,
      type: Type.header,
      opacity: FontOpacity.overLow,
    );
  }
}

class _Trailing extends StatelessWidget {
  final bool isDownloaded;
  final TranslateLanguage language;
  const _Trailing({required this.isDownloaded, required this.language});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfflineLanguagesCubit, OfflineLanguagesStates>(
      builder: (context, state) {
        var isLoading = false;
        if (isDownloaded) {
          isLoading =
              state is DeleteLanguageLoading &&
              state.languageId == language.bcpCode;
        } else {
          isLoading =
              state is DownloadLanguageLoading &&
              state.languageId == language.bcpCode;
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: _TrailingItem(
            language: language,
            isLoading: isLoading,
            isDownloaded: isDownloaded,
          )
        );
      },
    );
  }
}

class _TrailingItem extends StatelessWidget {
  final bool isLoading;
  final bool isDownloaded;
  final TranslateLanguage language;
  const _TrailingItem({
    required this.isLoading,
    required this.isDownloaded,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    var icon = isDownloaded ? IconBroken.Delete : IconBroken.Download;
    var color = isDownloaded
        ? Colors.redAccent
        : Theme.of(context).primaryColor;
    return isLoading
        ? SizedBox(
              width: 25.w,
              height: 25.h,
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                strokeWidth: 2.w,
              ),
        )
        : GestureDetector(
            onTap: () {
              if (isDownloaded) {
                OfflineLanguagesCubit.get(
                  context,
                ).deleteLanguage(language: language);
              } else {
                OfflineLanguagesCubit.get(
                  context,
                ).downloadLanguage(language: language);
              }
            },
            child: Icon(icon, color: color),
          );
  }
}
