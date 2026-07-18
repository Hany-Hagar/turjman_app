
import 'home_translate_card.dart';
import 'home_recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_languages_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w , vertical: 14.h),
        child: Column(
          spacing: 12.h,
          children: [
            const CustomLanguagesCard(),
            const HomeTranslateCard(),
            const HomeRecentTransactions(),
          ],
        ),
      ),
    );
  }
}
