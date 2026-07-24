import 'package:flutter/material.dart';
import '../../../../../consts/assets.dart';
import '../../manager/settings_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [_BgImage(), _Body()],
      ),
    );
  }
}

class _BgImage extends StatelessWidget {
  const _BgImage();

  @override
  Widget build(BuildContext context) {
    var isAr = getIt<SettingsCubit>().state.langIndex == 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.flip(
          flipX: isAr ? true : false,
          child: Image.asset(width: 250.w, Assets.appCardBg, fit: BoxFit.fill),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      horizontalTitleGap: 5.w,
      contentPadding: EdgeInsetsDirectional.only(start: 12.w, end: 12.w),
      leading: const _LeadingBody(),
      title: CustomText(
        text: S.of(context).appTitle,
        size: 18.sp,
        type: Type.header,
        color: Theme.of(context).primaryColor,
      ),
      subtitle: const _SubTitle(),
    );
  }
}

class _LeadingBody extends StatelessWidget {
  const _LeadingBody();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      width: 50.w,
      height: 50.h,
      Assets.appIcon,
      fit: BoxFit.fill,
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: S.of(context).appCardSubtitle,
          size: 12.sp,
          maxLines: 5,
          type: Type.header,
          opacity: FontOpacity.medium,
        ),
        _SubTitleBottom(),
      ],
    );
  }
}

class _SubTitleBottom extends StatelessWidget {
  const _SubTitleBottom();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Row(
      spacing: 3.w,
      children: [
        CustomText(
          text: "${s.version}: 1.0.0",
          size: 12.sp,
          maxLines: 5,
          type: Type.header,
          opacity: FontOpacity.medium,
        ),
        SizedBox(
          height: 10.h,
          child: VerticalDivider(
            color: Theme.of(context).disabledColor,
            thickness: 2.w,
          ),
        ),
        CustomText(
          text: "${s.update}: 2024-06-01",
          size: 12.sp,
          maxLines: 5,
          type: Type.header,
          opacity: FontOpacity.medium,
        ),
      ],
    );
  }
}
