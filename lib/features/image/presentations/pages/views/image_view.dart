import '../widgets/image_card.dart';
import '../widgets/image_body.dart';
import 'package:flutter/material.dart';
import '../../manager/image_cubit.dart';
import '../../manager/image_states.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/server_locator.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_languages_card.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ImageCubit>()..init(),

      child: BlocListener<ImageCubit, ImageStates>(
        listener: (context, state) {
          if (state is ImageProcessingSuccess) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.6,
                  minChildSize: 0.3,
                  maxChildSize: 0.95,
                  builder: (context, scrollController) => _Bottom(
                    extractedText: state.result.text,
                    translatedText: state.result.translatedText,
                  ),
                );
              },
            );
          }
        },
        child: CustomBackground(top: const _Top(), body: const ImageBody()),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomAppBar(
      title: s.imageTitle,
      subTitle: s.imageSubtitle,
      bottom: CustomLanguagesCard(padding: EdgeInsets.zero),
    );
  }
}

class _Bottom extends StatelessWidget {
  final String extractedText;
  final String translatedText;
  const _Bottom({required this.extractedText, required this.translatedText});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCard(title: s.source, value: extractedText, isSource: true),
            SizedBox(height: 10.h),
            ImageCard(
              title: s.translation,
              value: translatedText,
              isSource: false,
            ),
          ],
        ),
      ),
    );
  }
}
