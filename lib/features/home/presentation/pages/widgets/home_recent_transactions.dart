import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecentTransactions extends StatelessWidget {
  const HomeRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            size: 16.sp,
            type: Type.overMedium,
            text: s.recentTranslations,
          ),
          GestureDetector(
            onTap: () {},
            child: CustomText(
              text: s.viewAll,
              size: 14.sp,
              type: Type.overMedium,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
