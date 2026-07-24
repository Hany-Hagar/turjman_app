import 'package:flutter/material.dart';
import 'package:turjman_app/core/utils/styles.dart';
import '../../manager/settings_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../models/app_user_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ThemeItem extends StatelessWidget {
  const ThemeItem({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return ExpansionTile(
      minTileHeight: 50.h,
      shape: getShapeBorder(),
      collapsedShape: getShapeBorder(),
      backgroundColor: theme.cardColor,
      collapsedBackgroundColor: theme.cardColor,
      tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
      leading: _Leading(icon: IconBroken.Setting, iconColor: Colors.blue),
      title: CustomText(text: s.themeTitle, size: 16.sp, type: Type.overMedium),
      subtitle: CustomText(
        text: s.themeSubtitle,
        size: 12.sp,
        type: Type.header,
        opacity: FontOpacity.medium,
      ),
      children: [
        _Children(),
        SizedBox(height: 12.h),
      ],
    );
  }

  ShapeBorder getShapeBorder() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r));
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

class _Children extends StatelessWidget {
  const _Children();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<SettingsCubit, AppUserPref>(
      builder: (context, state) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: _Child(title: s.themeLight, themeMode: ThemeMode.light),
            ),
            Expanded(
              child: _Child(title: s.themeDark, themeMode: ThemeMode.dark),
            ),
            Expanded(
              child: _Child(title: s.themeSystem, themeMode: ThemeMode.system),
            ),
          ],
        ),
      ),
    );
  }
}

class _Child extends StatelessWidget {
  final String title;
  final ThemeMode themeMode;
  const _Child({required this.title, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    var cubit = SettingsCubit.get(context);
    var isSelected = cubit.state.theme == themeMode;
    return GestureDetector(
      onTap: () => cubit.updateTheme(themeMode),
      child: AnimatedContainer(
        height: 40.h,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 500),
            style:Styles.textStyle500.copyWith(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: 15.sp,
            ),
            child: CustomText(
              text: title,
              size: 15.sp,
              type: Type.overMedium,
            ),
          ),
        ),
      ),
    );
  }
}
