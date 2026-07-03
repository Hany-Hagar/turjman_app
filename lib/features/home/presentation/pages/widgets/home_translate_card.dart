// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class HomeTranslateCard extends StatelessWidget {
  const HomeTranslateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          _InputLanguage(),
          _TranslateText(),
          Divider(color: Colors.grey[300], height: 32.h, thickness: 1.0),
          const _Actions(),
        ],
      ),
    );
  }
}

class _InputLanguage extends StatelessWidget {
  const _InputLanguage();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LanguageTitle(title: s.source),
        CustomTextFormField(
          maxLines: 3,
          maxAutoLines: 5,
          autoMaxLines: false,
          border: InputBorder.none,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          hintText: s.sourceTextHint,
          hintStyle: Styles.textStyle500.copyWith(
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class _TranslateText extends StatelessWidget {
  const _TranslateText();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: double.infinity),
        _LanguageTitle(
          title: S.of(context).translation,
          titleColor: Theme.of(context).primaryColor,
        ),
        CustomText(
          size: 16.sp,
          text: "This is the translated text.",
          type: Type.overMedium,
        ),
      ],
    );
  }
}

class _LanguageTitle extends StatelessWidget {
  final String title;
  final Color? titleColor;
  const _LanguageTitle({required this.title, this.titleColor});

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).disabledColor;
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          CustomText(
            size: 16.sp,
            text: title,
            color: titleColor ?? color,
            type: Type.overMedium,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {},
            child: Icon(size: 22.sp, color: color, Icons.copy_all_outlined),
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _ActionItem(
              icon: IconBroken.Image,
              text: "Image",
              color: Colors.blue,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: _ActionItem(
              icon: IconBroken.Camera,
              text: 'Camera',
              color: Colors.green,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: _ActionItem(
              icon: IconBroken.Voice,
              text: 'Voice',
              color: Colors.orange,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const _ActionItem({
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        CircleAvatar(
          radius: 18.sp,
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 22.sp),
        ),
        Expanded(
          child: CustomText(text: text, size: 16.sp),
        ),
      ],
    );
  }
}
