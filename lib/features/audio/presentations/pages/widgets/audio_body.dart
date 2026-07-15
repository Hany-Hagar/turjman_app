import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turjman_app/features/audio/presentations/manager/audio_cubit.dart';
import 'package:turjman_app/features/audio/presentations/manager/audio_states.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class AudioBody extends StatelessWidget {
  const AudioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit,AudioStates>(
      builder:(context, state) {
        
    return  Column(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(size: 20.sp, text: "Source", type: Type.overMedium),
          CustomTextFormField(
            autoMaxLines: false,
            maxAutoLines: 5,
            maxLines: 5,
            controller: TextEditingController(),
            hintText: "Type something...",
          ),
          SizedBox(height: 5.h),
          CustomText(size: 20.sp, text: "Translation", type: Type.overMedium),
          CustomTextFormField(
            autoMaxLines: false,
            maxAutoLines: 5,
            maxLines: 6,
            controller: TextEditingController(),
            hintText: "Type something...",
            onChanged: (value) {},
          ),
        SizedBox(height: 5.h),
        CustomText(size: 20.sp, text: "Audio", type: Type.overMedium),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.mic),
            ),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.stop),
            ),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.cancel),
            ),
          ],
        )
        ],
      );
      },
    );
  }
}
