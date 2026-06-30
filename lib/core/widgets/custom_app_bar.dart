// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import '../../../../core/utils/nav_to.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/design_data.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final Widget? leading;
  final String title;
  final Widget? body;
  final Color? titleColor;
  final Color? backgroundColor;
  final Widget? trailing;
  const CustomAppBar({
    super.key,
    this.showBackButton = true,
    this.leading,
    required this.title,
    this.titleColor,
    this.body,
    this.backgroundColor,
    this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: defaultAppBarPadding(context: context),
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading ?? const SizedBox.shrink(),
          if (showBackButton) const _Start(),
          if (showBackButton) SizedBox(width: 16.w),
          _Title(text: title, titleColor: titleColor),
          if (body != null) Spacer(),
          body ?? const SizedBox.shrink(),
          Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Start extends StatelessWidget {
  const _Start();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavTo.pop(context),
      child: Icon(
        Icons.arrow_back_ios,
        size: 25.sp,
        color: Theme.of(context).hintColor,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;
  final Color? titleColor;
  const _Title({required this.text, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: 25.sp,
      type: Type.overMedium,
      color: titleColor ?? Theme.of(context).hintColor,
    );
  }
}
