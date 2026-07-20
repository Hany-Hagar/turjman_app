
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/offline_languages_body.dart';
import '../../../../../core/di/server_locator.dart';
import '../../manager/offline_languages_cubit.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_background.dart';

class OfflineLanguagesView extends StatelessWidget {
  const OfflineLanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OfflineLanguagesCubit>()..getLanguages(),
      child: CustomBackground(
        top: const _Top(),
        body: const SingleChildScrollView(
          child: OfflineLanguagesBody()
        ),
      )
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return CustomAppBar(
      title: s.offlineLanguagesTitle,
      subTitle: s.offlineLanguagesSubtitle,
    );
  }
}