import '../widgets/image_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      top: const _Top(),
      body: const ImageBody(),
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