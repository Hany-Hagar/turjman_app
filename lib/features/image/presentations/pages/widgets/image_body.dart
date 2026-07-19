import 'dart:io';
import 'image_picker_card.dart';
import 'package:flutter/material.dart';
import '../../manager/image_cubit.dart';
import '../../manager/image_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageStates>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        if (cubit.selectedImage != null) {
          return Center(
            child: _Image(
              image: cubit.selectedImage!,
              isLoading: state is ImageProcessingLoading,
            )
          );
        }
        return ImagePickerCard();
      },
    );
  }
}

class _Image extends StatelessWidget {
  final bool isLoading;
  final File image;
  const _Image({required this.isLoading, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.file(image, width: double.infinity, fit: BoxFit.contain),
        if (isLoading)
          SizedBox(width: 30.w, child: CircularProgressIndicator()),
      ],
    );
  }
}
