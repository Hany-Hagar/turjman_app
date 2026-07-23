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
  final Widget? navigationPage;
  final bool isSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.navigationPage,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => isSwitch
          ? onSwitchChanged?.call(!switchValue)
          : NavTo.push(context: context, nextPage: navigationPage!),
      minTileHeight: 50.h,
      contentPadding: _getPadding(),
      tileColor: Theme.of(context).cardColor,
      leading: _Leading(icon: icon, iconColor: iconColor),
      title: CustomText(text: title, size: 16.sp, type: Type.overMedium),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      subtitle: CustomText(
        text: subtitle,
        size: 12.sp,
        maxLines: 2,
        type: Type.header,
        opacity: FontOpacity.overLow,
      ),
      trailing: isSwitch
          ? _Switch(value: switchValue, onChanged: onSwitchChanged!)
          : Icon(_getTrailingIcon(context: context), size: 24.sp),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    if (isSwitch) {
      return EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h);
    } else {
      return EdgeInsetsDirectional.only(
        start: 12.w,
        end: 0.w,
        top: 0.h,
        bottom: 0.h,
      );
    }
  }

  IconData _getTrailingIcon({required BuildContext context}) {
    return SettingsCubit.get(context).state.langIndex == 0
        ? IconBroken.Arrow___Right_2
        : IconBroken.Arrow___Left_2;
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

class _Switch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _Switch({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: Colors.green,
      ),
    );
  }
}
