import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'audio_body_item.dart';
import 'audio_body_actions.dart';
import 'package:flutter/material.dart';

class AudioBody extends StatelessWidget {
  const AudioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Expanded(flex: 2, child: AudioBodyItem(isSource: true)),
        Expanded(flex: 2, child: AudioBodyItem(isSource: false)),
        const Expanded(flex: 1, child: AudioBodyActions()),
      ],
    );
  }
}
