import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsDirectional defaultAppBarPadding({required BuildContext context}) {
  return EdgeInsetsDirectional.only(
    top: MediaQuery.of(context).padding.top,
    start: 16.w,
    end: 16.w,
    bottom: 10.h,
  );
}

var primaryButtonGradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF005DA7), Color(0xFF8135C5)],
);
