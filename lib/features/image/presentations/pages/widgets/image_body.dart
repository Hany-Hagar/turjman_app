import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_languages_card.dart';
import '../../manager/image_cubit.dart';
import '../../manager/image_states.dart';
import 'image_picker_card.dart';
import 'package:flutter/material.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageStates>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        if (cubit.selectedImage != null) {
          return _Image(image: cubit.selectedImage!);
        }
        return ImagePickerCard();
      },
    );
  }
}

class _Image extends StatelessWidget {
  final File image;
  const _Image({required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomLanguagesCard(),
        Image.file(image, width: double.infinity)
      ]
    );
  }
}
