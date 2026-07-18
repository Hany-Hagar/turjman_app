import '../widgets/image_body.dart';
import 'package:flutter/material.dart';
import '../../manager/image_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ImageCubit>()..init(),
      child: CustomBackground(
        top: const _Top(),
        body: const ImageBody(),
      )
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Image to Text',
      subTitle: "Convert images to text using OCR technology.",
    );
  }
}