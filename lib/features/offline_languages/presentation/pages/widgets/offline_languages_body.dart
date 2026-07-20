import 'offline_languages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/offline_languages_cubit.dart';
import '../../manager/offline_languages_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfflineLanguagesBody extends StatelessWidget {
  const OfflineLanguagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfflineLanguagesCubit, OfflineLanguagesState>(
      builder: (context, state) {
        var cubit = OfflineLanguagesCubit.get(context);
        return Column(
          spacing: 15.h,
          children: [
            OfflineLanguagesList(
              title: "Download Languages",
              isLoading: state is OfflineLanguagesLoading,
              isFailure: state is OfflineLanguagesFailure,
              languages: cubit.downloadedLanguages,
            ),
            OfflineLanguagesList(
              title:"Other Languages",
              isLoading: state is OfflineLanguagesLoading,
              isFailure: state is OfflineLanguagesFailure,
              languages: cubit.otherLanguages,
            ),
          ],
        );
      },
    );
  }
}
