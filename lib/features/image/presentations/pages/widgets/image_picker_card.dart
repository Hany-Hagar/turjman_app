import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/services/icon_broken.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/image_cubit.dart';

class ImagePickerCard extends StatelessWidget {
  const ImagePickerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: DottedBorder(
        dashPattern: const [8, 5],
        borderType: BorderType.RRect,
        radius: Radius.circular(10.r),
        color: Colors.deepPurple.shade200,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              const Spacer(flex: 3),
              const _Image(),
              const Spacer(flex: 1),
              _Text(),
              const Spacer(flex: 1),
              _PickerButtons(),
              const Spacer(flex: 1),
              _SupportExtensions(),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/imagePicker.png", width: double.infinity);
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 2.h,
      children: [
        CustomText(text: "Select an image", size: 22.sp, type: Type.overMedium),
        CustomText(
          text:
              "Choose an image from your gallery\nor capture a new one to extract text.",
          size: 16.sp,
          textAlign: TextAlign.center,
          opacity: FontOpacity.overLow,
        ),
      ],
    );
  }
}

class _PickerButtons extends StatelessWidget {
  const _PickerButtons();

  @override
  Widget build(BuildContext context) {
    var cubit = ImageCubit.get(context);
    return Column(
      spacing: 12.h,
      children: [
        CustomButton(
          onPressed: () => cubit.pickImage(fromCamera: false),
          icon: IconBroken.Image,
          label: "Choose from Gallery",
        ),
        CustomButton(
          isOutlined: true,
          onPressed: () => cubit.pickImage(fromCamera: true),
          icon: IconBroken.Camera,
          label: "Take a Photo",
        ),
      ],
    );
  }
}

class _SupportExtensions extends StatelessWidget {
  const _SupportExtensions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: double.infinity, height: 12.h),
        Row(
          spacing: 12.w,
          children: [
            const Expanded(child: Divider()),
            CustomText(text: "OR", size: 14.sp, opacity: FontOpacity.overLow),
            const Expanded(child: Divider()),
          ],
        ),
        SizedBox(width: double.infinity, height: 12.h),
        CustomText(
          text: "Supported formats: JPG, PNG, JPEG",
          size: 14.sp,
          type: Type.medium,
          opacity: FontOpacity.overLow,
        ),
      ],
    );
  }
}
