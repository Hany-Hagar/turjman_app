import '../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/snack_bar_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopyIcon extends StatelessWidget {
  final String value;
  final Color? color;
  final double? size;
  const CopyIcon({super.key, required this.value, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (value.trim().isEmpty) return;
        await Clipboard.setData(ClipboardData(text: value));
        if (!context.mounted) return;
        SnackBarService.success(
          context: context,
          message: S.of(context).copySuccess,
        );
      },
      child: Icon(
        Icons.copy_all_outlined,
        size: (size ?? 22).sp,
        color: color ?? Theme.of(context).disabledColor,
      ),
    );
  }
}
