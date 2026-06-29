import 'dart:developer';

import 'package:flutter/material.dart';
import '../../models/on_boarding_model.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../settings/presentation/manager/settings_cubit.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  final Widget pageIndicator;
  const OnBoardingBody({
    super.key,
    required this.onBoardingModel,
    required this.pageIndicator,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onBoardingModel.backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          pageIndicator,
          SizedBox(height: 15.h),
          _Button(
            pageController: pageController,
            onBoardingModel: onBoardingModel,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  const _Button({required this.pageController, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    var color = Colors.white;
    var isArabic = SettingsCubit.get(context).state.langIndex == 1;
    return GestureDetector(
      onTap: () {
        if (onBoardingModel.id == onBoardingData(context).length) {
          log('Get Started button pressed');
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: onBoardingModel.buttonTitle,
              size: 18.sp,
              color: color,
              type: Type.overMedium,
            ),
            Icon(
              isArabic ? IconBroken.Arrow___Left_2 : IconBroken.Arrow___Right_2,
              size: 20.sp,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}




