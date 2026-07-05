import 'home_translate_card.dart';
import '../../manager/home_cubit.dart';
import 'home_recent_transactions.dart';
import 'package:flutter/material.dart';
import '../../manager/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_drop_down_menu.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const _LanguageCard(),
          const HomeTranslateCard(),
          const HomeRecentTransactions(),
        ],
      )
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is GetSupportedLanguagesLoadingState,
          child: Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _Languages(),
          ),
        );
      },
    );
  }
}

class _Languages extends StatelessWidget {
  const _Languages();

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.get(context);
    return Row(
      children: [
        _LanguageItem(
          languages: cubit.sourceLanguages,
          selectedLanguage: cubit.selectedSourceLanguage,
          onChanged: (language) => cubit.changeSourceLanguage(language),
        ),
        const _Swap(),
        _LanguageItem(
          languages: cubit.targetLanguages,
          selectedLanguage: cubit.selectedTargetLanguage,
          onChanged: (language) => cubit.changeTargetLanguage(language),
        ),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final List<String> languages;
  final String selectedLanguage;
  final Function(String?) onChanged;
  const _LanguageItem({
    required this.languages,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomDropDownMenu(
        value: selectedLanguage,
        items: languages,
        hintText: 'Select Language',
        onChanged: onChanged,
      ),
    );
  }
}

class _Swap extends StatelessWidget {
  const _Swap();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HomeCubit.get(context).swapLanguages(),
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.swap_horiz,
          size: 24.sp,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
