import 'audio_body_item.dart';
import 'audio_body_actions.dart';
import 'package:flutter/material.dart';

class AudioBody extends StatelessWidget {
  const AudioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            AudioBodyItem(
              isSource: true,
            ),
            AudioBodyItem(
              isSource: false,
            ),
            const AudioBodyActions(),
          ],
    );
  }
}
