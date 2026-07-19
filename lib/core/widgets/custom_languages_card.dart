import '../services/icon_broken.dart';
import 'package:flutter/material.dart';
import 'custom_languages_drop_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/home/presentation/manager/home_states.dart';

class CustomLanguagesCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const CustomLanguagesCard({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is GetSupportedLanguagesLoadingState,
          child: Container(
            margin: EdgeInsets.zero,
            padding: padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              spacing: 8.w,
              children: [
                Expanded(child: CustomLanguagesDropMenu(isSource: true)),
                const _Swap(),
                Expanded(child: CustomLanguagesDropMenu(isSource: false)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Swap extends StatelessWidget {
  const _Swap();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HomeCubit.get(context).swapLanguages(),
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: Theme.of(context).primaryColor,
        child: Transform.rotate(
          angle: 90 * 3.14 / 180,
          child: Icon(
            IconBroken.Swap,
            size: 24.sp,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
