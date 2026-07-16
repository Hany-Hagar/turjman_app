import 'package:flutter/material.dart';
import '../../manager/audio_cubit.dart';
import '../../manager/audio_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioBodyActions extends StatelessWidget {
  const AudioBodyActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioStates>(
      builder: (context, state) {
        var isListening = AudioCubit.get(context).isListening;
        return Container(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            top: 16.h,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () => AudioCubit.get(context).toggleListening(),
              child: _Actionitem(
                icon: isListening ? Icons.pause : Icons.play_arrow,
                text: isListening ? "Pause" : "Play",
                iconBackgroundColor: isListening ? Colors.green : Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Actionitem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconBackgroundColor;
  const _Actionitem({
    required this.icon,
    required this.text,
    required this.iconBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 24.sp,
          ),
        ),
        SizedBox(height: 4.h),
        CustomText(text: text, size: 16.sp, type: Type.overMedium),
      ],
    );
  }
}
