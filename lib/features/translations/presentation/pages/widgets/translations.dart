import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/translations_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/translations_states.dart';
import '../../../../../core/widgets/copy_icon.dart';
import '../../../data/models/translation_model.dart';
import '../../../../../core/widgets/lottie_card.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Translations extends StatelessWidget {
  final bool isRecent;
  const Translations({super.key, required this.isRecent});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationsCubit, TranslationsStates>(
      builder: (context, state) {
        var cubit = TranslationsCubit.get(context);
        var isLoading = state is FetchTranslationsLoadingState;
        if (state is FetchTranslationsErrorState) {
          return LottieCard(errorMessage: state.errorMessage);
        }
        return _List(
          isRecent: isRecent,
          isLoading: isLoading,
          items: isLoading
              ? List.generate(5, (index) => TranslationModel.empty())
              : cubit.translations,
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  final bool isRecent;
  final bool isLoading;
  final List<TranslationModel> items;
  const _List({
    required this.isRecent,
    required this.isLoading,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty && !isLoading) {
      return LottieCard(isRecent: isRecent);
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => _Item(item: items[index]),
      physics: isRecent ? const NeverScrollableScrollPhysics() : null,
    );
  }
}

class _Item extends StatelessWidget {
  final TranslationModel item;
  const _Item({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          _ItemData(value: item.sourceText, isSource: true),
          _ItemData(value: item.translatedText, isSource: false),
        ],
      ),
    );
  }
}

class _ItemData extends StatelessWidget {
  final String value;
  final bool isSource;
  const _ItemData({required this.value, required this.isSource});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              size: 16.sp,
              text: isSource ? s.sourceTitle : s.translationTitle,
              color: isSource ? theme.disabledColor : theme.primaryColor,
              type: Type.overMedium,
            ),
            Spacer(),
            CopyIcon(value: value, size: 20.sp),
          ],
        ),
        CustomText(text: value, size: 16.sp, type: Type.medium),
      ],
    );
  }
}
