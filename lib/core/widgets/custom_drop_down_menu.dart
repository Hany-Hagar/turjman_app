// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  const CustomDropDownMenu({
    super.key,
    required this.value,
    required this.items,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.hintColor.withOpacity(0.2);
    final hasItems = items.isNotEmpty;
    final selectedValue = hasItems && value != null && items.contains(value)
        ? value
        : null;

    return DropdownButtonFormField<String>(
      dropdownColor: Colors.blue,
      focusColor: Colors.blue,
      
      value: selectedValue,
      hint: hintText == null
          ? null
          : CustomText(
              text: hintText!,
              size: 18.sp,
              opacity: FontOpacity.medium,
            ),
      isExpanded: true,
      isDense: true,
      icon: _icon(Icons.arrow_drop_down, theme.primaryColor),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: theme.cardColor,
        border: _inputBorder(borderColor),
        enabledBorder: _inputBorder(borderColor),
        focusedBorder: _inputBorder(theme.primaryColor),
      ),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: CustomText(text: item, size: 18.sp),
            ),
          )
          .toList(),
      onChanged: hasItems ? onChanged : null,
    );
  }
}

Padding _icon(IconData icon, Color color) {
  return Padding(
    padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
    child: Icon(icon, color: color, size: 24.sp),
  );
}

InputBorder _inputBorder(Color color) {
  return InputBorder.none;
}
