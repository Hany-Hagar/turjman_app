import 'offline_languages_list.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/offline_languages_cubit.dart';
import '../../manager/offline_languages_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfflineLanguagesBody extends StatelessWidget {
  const OfflineLanguagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return BlocBuilder<OfflineLanguagesCubit, OfflineLanguagesStates>(
      builder: (context, state) {
        var cubit = OfflineLanguagesCubit.get(context);
        return Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            spacing: 15.h,
            children: [
              OfflineLanguagesList(
                isDownloaded: true,
                title: s.downloadedLanguages,
                isLoading: state is OfflineLanguagesLoading,
                isFailure: state is OfflineLanguagesFailure,
                languages: cubit.downloadedLanguages,
              ),
              OfflineLanguagesList(
                isDownloaded: false,
                title: s.otherLanguages,
                isLoading: state is OfflineLanguagesLoading,
                isFailure: state is OfflineLanguagesFailure,
                languages: cubit.otherLanguages,
              ),
            ],
          ),
        );
      },
    );
  }
}
