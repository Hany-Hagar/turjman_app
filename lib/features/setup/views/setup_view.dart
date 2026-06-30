import '../../../consts/assets.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../widgets/name_setup_body.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'package:turjman_app/core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.setupBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const _Top(),
            Expanded(child: NameSetupBody()),
          ],
        ),
      )
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomAppBar(
      showBackButton: false,
      title: s.appTitle,
      titleColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.transparent,
      body: _PageIndicator(pageController: PageController()),
      trailing: GestureDetector(
        child: CustomText(
          text: s.skip,
          size: 20.sp,
          type: Type.overMedium,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final PageController pageController;
  const _PageIndicator({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: SmoothPageIndicator(
        controller: pageController,
        count: 4,
        effect: const SlideEffect(
          spacing: 8,
          dotWidth: 24,
          dotHeight: 4,
          activeDotColor: Colors.deepPurple,
          dotColor: Colors.grey,
        ),
      ),
    );
  }
}
