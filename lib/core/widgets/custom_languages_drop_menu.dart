import 'package:country_flags/country_flags.dart';

import '../mapping/language_to_country.dart';
import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/home/presentation/manager/home_states.dart';

class CustomLanguagesDropMenu extends StatelessWidget {
  final bool isSource;
  const CustomLanguagesDropMenu({super.key, required this.isSource});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: const Color(0xffE8E8F2)),
          ),
          child: Center(
            child: _DropDownMenu(
              value: isSource
                  ? cubit.selectedSourceLanguage
                  : cubit.selectedTargetLanguage,
              items: isSource ? cubit.sourceLanguages : cubit.targetLanguages,
              onChanged: isSource
                  ? (value) => cubit.changeSourceLanguage(value)
                  : (value) => cubit.changeTargetLanguage(value),
            ),
          ),
        );
      },
    );
  }
}

class _DropDownMenu extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  const _DropDownMenu({
    required this.value,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PopupMenuButton<String>(
      elevation: 4,
      onSelected: onChanged,
      offset: Offset(0, 48.h),
      padding: EdgeInsets.zero,
      itemBuilder: (context) => _items(),
      constraints: const BoxConstraints(),
      borderRadius: BorderRadius.circular(16.r),
      child: Row(
        spacing: 4.w,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 4.w),
          CountryFlag.fromCountryCode(
            languageToCountry[value] ?? 'UN',
            theme: ImageTheme(
              width: 22.w,
              height: 22.h,
              shape: Circle(),
            ),
          ),
          SizedBox(width: 1.w),
          Flexible(
            child: _text(text: value ?? "Select")
          ),
          Transform.translate(
            offset: Offset(0, 1.5.h),
            child: Icon(
              Icons.arrow_drop_down,
              size: 22.sp,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _text({required String text}) =>
      CustomText(text: text, size: 16.sp, type: Type.overMedium);

  List<PopupMenuEntry<String>> _items() =>
      items.map((e) => _item(text: e)).toList();

  PopupMenuItem<String> _item({required String text}) => PopupMenuItem<String>(
    value: text,
    child: _text(text: text),
  );
}
