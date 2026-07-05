import 'custom_text.dart';
import '../../consts/assets.dart';
import '../../generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LottieCard extends StatelessWidget {
  final bool isRecent;
  final String? errorMessage;
  const LottieCard({super.key, this.isRecent = false, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width ;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isRecent) SizedBox(height: 16.h),
          Lottie.asset(
            fit: BoxFit.fill,
            width: isRecent ? width*0.6 : width*0.8,
            height: MediaQuery.of(context).size.height * 0.3,
            errorMessage != null ? Assets.error : Assets.empty,
          ),
          CustomText(
            size: 22.sp,
            type: Type.medium,
            text: errorMessage ?? S.of(context).emptyTranslations,
          ),
        ],
      ),
    );
  }
}
