

import '../../../../../generated/l10n.dart';
import '../widgets/audio_body.dart';
import 'package:flutter/material.dart';
import '../../manager/audio_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turjman_app/core/widgets/custom_app_bar.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AudioCubit>()..initialize(),
      child: CustomBackground(
        top: _Top(),
        body: Padding(
          padding: EdgeInsets.all(12.w),
          child: const AudioBody()
        )
      )
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).audioTitle,
      subTitle: S.of(context).aduioSubtitle,
    );
  }
}
