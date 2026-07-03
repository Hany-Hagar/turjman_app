
import '../widgets/home_body.dart';
import 'package:flutter/material.dart';
import '../../../../../consts/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(top: _Top(), body: HomeBody());
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: S.of(context).appTitle,
      leadingWidget: Image.asset(Assets.appIcon, width: 40, height: 40),
      action: GestureDetector(
        child: Icon(IconBroken.Setting, size: 28.sp),
      ),
    );
  }
}
