import 'package:flutter/material.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../manager/settings_cubit.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget navigationPage;
  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.navigationPage,
  });

  @override
  Widget build(BuildContext context) {
    var trailingIcon = SettingsCubit.get(context).state.langIndex == 0
        ? IconBroken.Arrow___Right_2
        : IconBroken.Arrow___Left_2;
    return ListTile(
      onTap: () => NavTo.push(context: context, nextPage: navigationPage),
      minTileHeight: 50.h,
      tileColor: Theme.of(context).cardColor,
      trailing: Icon(trailingIcon, size: 24.sp),
      leading: _Leading(icon: icon, iconColor: iconColor),
      title: CustomText(text: title, size: 16.sp, type: Type.overMedium),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      subtitle: CustomText(
        text: subtitle,
        size: 12.sp,
        type: Type.header,
        opacity: FontOpacity.overLow,
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  const _Leading({required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: iconColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Icon(icon, color: iconColor, size: 30.sp),
    );
  }
}

