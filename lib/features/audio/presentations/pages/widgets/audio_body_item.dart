import 'package:flutter/material.dart';
import '../../manager/audio_cubit.dart';
import '../../manager/audio_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_languages_drop_menu.dart';

class AudioBodyItem extends StatelessWidget {
  final bool isSource;
  const AudioBodyItem({super.key, required this.isSource});

  @override
  Widget build(BuildContext context) {
    var title = isSource ? "Source Text" : "Target Text";
    return BlocBuilder<AudioCubit, AudioStates>(
      builder: (context, state) {
        var theme = Theme.of(context);
        var cubit = AudioCubit.get(context);
        var value = isSource ? cubit.sourceText : "مرحبا";
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
              _ItemTop(title: title, isSource: isSource),
              SizedBox(height: 10.h),
              _ItemBody(text: value),
            ],
          ),
        );
      },
    );
  }
}

class _ItemTop extends StatelessWidget {
  final bool isSource;
  final String title;
  const _ItemTop({required this.title, required this.isSource});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(size: 16.sp, text: title, type: Type.overMedium),
        CustomLanguagesDropMenu(isSource: isSource),
      ],
    );
  }
}

class _ItemBody extends StatelessWidget {
  final String text;
  const _ItemBody({required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: 16.sp,
      type: Type.header,
      color: Colors.black,
      maxLines: 15
    );
    // return CustomTextFormField(
    //   maxLines: 5,
    //   readOnly: true,
    //   maxAutoLines: 5,
    //   initialValue: text,
    //   autoMaxLines: false,
    //   backgroundColor: Colors.grey[100],
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(5.r),
    //     borderSide: BorderSide(color: Colors.transparent),
    //   ),
    // );
  }
}
