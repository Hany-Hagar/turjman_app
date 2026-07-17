import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final String label;
  final IconData icon;
  final bool isOutlined;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  const CustomButton({
    super.key,
    this.height = 50,
    this.borderRadius = 6,
    this.width = double.infinity,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.isOutlined = false,
    this.color = Colors.white,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var bgColor = backgroundColor ?? Theme.of(context).primaryColor;
    var itemColor = isOutlined ? bgColor : Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: isOutlined ? Colors.transparent : bgColor,
          border: Border.all(
            color: isOutlined ? bgColor : Colors.transparent,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22.sp, color: itemColor),
            CustomText(text: label, size: 18.sp, color: itemColor , type: Type.overMedium),
          ],
        ),
      ),
    );
  }
}
