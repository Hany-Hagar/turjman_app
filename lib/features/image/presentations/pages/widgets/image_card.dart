import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/copy_icon.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isSource;
  const ImageCard({
    super.key,
    required this.title,
    required this.value,
    required this.isSource,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ItemTop(title: title, value: value, isSource: isSource),
          SizedBox(height: 10.h),
          _ItemBody(text: value),
        ],
      ),
    );
  }
}

class _ItemTop extends StatelessWidget {
  final bool isSource;
  final String title;
  final String value;
  const _ItemTop({
    required this.title,
    required this.isSource,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSource ? Colors.blue : Colors.deepPurple;
    final IconData icon = isSource ? IconBroken.Voice_2 : IconBroken.Swap;
    return Row(
      spacing: 10.w,
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: color.withValues(alpha: 0.2),
          ),
          child: Center(
            child: Icon(icon, size: 20.sp, color: color),
          ),
        ),
        Expanded(
          child: CustomText(size: 20.sp, text: title, type: Type.overMedium),
        ),
        CopyIcon(value: value),
      ],
    );
  }
}

class _ItemBody extends StatelessWidget {
  final String text;
  const _ItemBody({required this.text});

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return SizedBox(
      height: 180.h,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.grey.withValues(alpha: 0.2),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: scrollController,
            child: SelectableText(
              text,
              style: Styles.textStyle700.copyWith(
                fontSize: 16.sp,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
