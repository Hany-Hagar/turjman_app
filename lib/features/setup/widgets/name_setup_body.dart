import '../../../consts/assets.dart';
import 'package:flutter/material.dart';
import '../../../core/services/icon_broken.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameSetupBody extends StatelessWidget {
  const NameSetupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _Vector()),
        _Data(),
      ],
    );
  }
}

class _Vector extends StatelessWidget {
  const _Vector();

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.setupVector, width: double.infinity, height: 200);
  }
}

class _Data extends StatelessWidget {
  const _Data();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            height: 1.5,
            text: 'Welcome!',
            size: 22.sp,
            type: Type.header,
            color: Theme.of(context).primaryColor,
          ),
          CustomText(
            height: 1.5,
            text: 'What is your name?',
            size: 22.sp,
            type: Type.header,
            color: Theme.of(context).primaryColor,
          ),
          CustomText(
            height: 1.5,
            text: 'Please enter your name below.',
            size: 20.sp,
            type: Type.medium,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            hintText: 'Enter your name',
            onChanged: (value) {},
            prefixIcon: IconBroken.User,
          ),
          SizedBox(height: 15.h),
          CustomButton(
            onPressed: () {},
            text: 'Continue',
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
