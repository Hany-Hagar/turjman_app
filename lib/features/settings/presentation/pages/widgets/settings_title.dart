import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turjman_app/features/settings/presentation/manager/settings_cubit.dart';
import '../../../../../core/widgets/custom_text.dart';

class SettingsTitle extends StatelessWidget {
  final double size;
  final String title;
  final Color? color;
  const SettingsTitle({super.key, required this.title, this.size = 16, this.color});

  @override
  Widget build(BuildContext context) {
    var fontSize = SettingsCubit.get(context).state.langIndex == 0 ? size : size+5;
    return CustomText(
      text: title.toUpperCase(),
      size: fontSize.sp,
      letterSpacing: 1,
      type: Type.overMedium,
      color: color ?? Theme.of(context).disabledColor,
    );
  }
}
