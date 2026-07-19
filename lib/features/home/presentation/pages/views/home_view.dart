
import '../widgets/home_body.dart';
import 'package:flutter/material.dart';
import '../../../../../consts/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/nav_to.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_background.dart';
import '../../../../settings/presentation/pages/views/settings_view.dart';

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
      title: S.of(context).homeTitle,
      subTitle: S.of(context).homeSubtitle,
      leadingWidget: Image.asset(Assets.appIcon, width: 40, height: 40),
      action: GestureDetector(
        onTap:() => NavTo.push(context: context, nextPage: const SettingsView()),
        child: Icon(IconBroken.Setting, size: 28.sp),
      ),
    );
  }
}
