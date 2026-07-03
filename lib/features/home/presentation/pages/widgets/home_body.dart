import 'home_translate_card.dart';
import 'home_recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_drop_down_menu.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _LanguageCard(),
        const HomeTranslateCard(),
        const HomeRecentTransactions(),
      ],
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: _LanguageItem(
              selectedLanguage: 'English',
              languages: ['English', 'Spanish', 'French'],
            ),
          ),
          const _Swap(),
          Expanded(
            child: _LanguageItem(
              selectedLanguage: 'English',
              languages: ['English', 'Spanish', 'French'],
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final List<String> languages;
  final String selectedLanguage;
  const _LanguageItem({
    required this.languages,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropDownMenu(
      value: selectedLanguage,
      items: languages,
      hintText: 'Select Language',
      onChanged: (value) {
        // Handle language selection change
      },
    );
  }
}

class _Swap extends StatelessWidget {
  const _Swap();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.swap_horiz,
        size: 24.sp,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}


