
import '../../manager/home_cubit.dart';
import 'package:flutter/material.dart';
import '../../manager/home_states.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/copy_icon.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../audio/presentations/pages/views/audio_view.dart';
import '../../../../image/presentations/pages/views/image_view.dart';

class HomeTranslateCard extends StatelessWidget {
  const HomeTranslateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) => Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            _SourceLanguage(),
            _TargetLanguage(),
            Divider(color: Colors.grey[300], height: 32.h, thickness: 1.0),
            const _Actions(),
          ],
        ),
      ),
    );
  }
}

class _SourceLanguage extends StatelessWidget {
  const _SourceLanguage();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var cubit = HomeCubit.get(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _LanguageTitle(title: s.source, copyValue: cubit.targetText),
        CustomTextFormField(
          maxLines: 3,
          maxAutoLines: 5,
          border: InputBorder.none,
          padding: EdgeInsets.zero,
          hintText: s.sourceTextHint,
          autoMaxLines: cubit.isTranslating,
          backgroundColor: Colors.transparent,
          controller: cubit.sourceTextController,
          hintStyle: Styles.textStyle500.copyWith(
            color: Theme.of(context).hintColor.withValues(alpha: 0.5),
            fontSize: 14.0,
          ),
          onChanged: (value) =>
              HomeCubit.get(context).onSourceTextChanged(value),
        ),
      ],
    );
  }
}

class _TargetLanguage extends StatelessWidget {
  const _TargetLanguage();

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    bool isTranslating = cubit.isTranslating;
    return isTranslating
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: double.infinity),
              _LanguageTitle(
                title: S.of(context).translation,
                titleColor: Theme.of(context).primaryColor,
                copyValue: cubit.targetText,
              ),
              CustomText(
                size: 16.sp,
                maxLines: 5,
                type: Type.overMedium,
                text: cubit.targetText,
              ),
            ],
          )
        : SizedBox.shrink();
  }
}

class _LanguageTitle extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String copyValue;
  const _LanguageTitle({
    required this.title,
    this.titleColor,
    required this.copyValue,
  });

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).hintColor.withValues(alpha: 0.7);
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
          CopyIcon(value: copyValue, size: 20.sp),
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
              color: Colors.blue,
              icon: IconBroken.Image,
              text: S.of(context).image,
              onPressed: () =>
                  NavTo.push(context: context, nextPage: const ImageView()),
            ),
          ),
          Expanded(
            child: _ActionItem(
              color: Colors.orange,
              icon: IconBroken.Voice,
              text: S.of(context).voice,
              onPressed: () =>
                  NavTo.push(context: context, nextPage: const AudioView()),
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
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        spacing: 8.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18.sp,
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color, size: 22.sp),
          ),
          CustomText(text: text, size: 16.sp),
        ],
      ),
    );
  }
}
