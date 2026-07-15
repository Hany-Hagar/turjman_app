import '../../consts/app_data.dart';
import '../services/icon_broken.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/nav_to.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';

class CustomAppBar extends StatelessWidget {
  final IconData? leading;
  final Widget? leadingWidget;
  final Color? iconColor;
  final String title;
  final String? subTitle;
  final Widget? bottom;
  final Color? backgroundColor;
  final Widget? action;
  final bool centerTitle;
  const CustomAppBar({
    super.key,
    this.leading,
    this.leadingWidget,
    this.iconColor,
    required this.title,
    this.subTitle,
    this.bottom,
    this.backgroundColor,
    this.action,
    this.centerTitle = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getBoxDecoration(context),
      padding: AppData.defaultAppBarPadding(context),
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              leadingWidget ?? _Start(iconColor: iconColor, leading: leading),
              Expanded(child: _Title(text: title , subTitle: subTitle, centerTitle: centerTitle)),
              ?action,
            ],
          ),
          ?bottom,
        ],
      ),
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      borderRadius: bottom != null
          ? BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            )
          : null,
    );
  }
}

class _Start extends StatelessWidget {
  final Color? iconColor;
  final IconData? leading;

  const _Start({required this.iconColor, required this.leading});

  @override
  Widget build(BuildContext context) {
    bool isArabic = SettingsCubit.get(context).state.lang == 'ar';
    return GestureDetector(
      onTap: () => NavTo.pop(context),
      child: Icon(
        leading ??
            (isArabic ? IconBroken.Arrow___Right : IconBroken.Arrow___Left),
        size: 25.sp,
        color: iconColor ?? Theme.of(context).hintColor,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  final String? subTitle;
  final bool centerTitle;
  const _Title({required this.text, this.subTitle,  required this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
            text: text,
            size: 20.sp,
            height: 0.9,
            type: Type.overMedium,
            color: Theme.of(context).hintColor,
          )
        ),
        if (subTitle != null) _SubTitle(text: subTitle!),
      ],
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String text;
  const _SubTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: 14.sp,
      type: Type.medium,
      color: Theme.of(context).hintColor,
    );
  }
}
