import 'custom_text.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatelessWidget {
  final bool isLoading;
  final bool isFailure;
  final double? topPadding;
  final String? emptyImagePath;
  final String? errorMessage;
  final List items;
  final List emptyItems;
  final void Function(dynamic)? itemTab;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext, dynamic) itemBuilder;
  const CustomList({
    super.key,
    this.topPadding,
    required this.isLoading,
    required this.isFailure,
    required this.items,
    this.emptyImagePath,
    required this.emptyItems,
    required this.itemBuilder,
    this.itemTab,
    this.scrollPhysics,
    this.padding,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return _Body(
        topPadding: topPadding,
        isLoading: isLoading,
        isFailure: isFailure,
        items: items,
        errorMessage: errorMessage,
        emptyImagePath: emptyImagePath,
        loadingItems: emptyItems,
        itemBuilder: (item) => itemBuilder(context, item),
        itemTab: itemTab,
        scrollPhysics: scrollPhysics,
        padding: padding,
    );
  }
}

class _Body extends StatelessWidget {
  final bool isLoading;
  final bool isFailure;
  final double? topPadding;
  final String? emptyImagePath;
  final String? errorMessage;
  final List items;
  final List loadingItems;
  final Widget Function(dynamic) itemBuilder;
  final void Function(dynamic)? itemTab;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;

  const _Body({
    // ignore: unused_element_parameter
    this.topPadding,
    required this.isLoading,
    required this.isFailure,
    this.errorMessage,
    this.emptyImagePath,
    required this.items,
    required this.loadingItems,
    required this.itemBuilder,
    this.itemTab,
    this.scrollPhysics,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _Loading(
        loadingItems: loadingItems,
        itemBuilder: itemBuilder,
        scrollPhysics: scrollPhysics,
        padding: padding,
      );
    }
    if (isFailure) {
      return _Failure(
        topPadding: topPadding,
        errorMessage: errorMessage,
      );
    }
    return _List(
      topPadding: topPadding,
      items: items,
      emptyImagePath: emptyImagePath,
      itemBuilder: itemBuilder,
      itemTab: itemTab,
      scrollPhysics: scrollPhysics,
      padding: padding,
    );
  }
}

class _Loading extends StatelessWidget {
  final List loadingItems;
  final Widget Function(dynamic) itemBuilder;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;
  const _Loading({
    required this.loadingItems,
    required this.itemBuilder,
    this.scrollPhysics,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: _List(
        topPadding: 0,
        items: loadingItems,
        itemBuilder: itemBuilder,
        scrollPhysics: scrollPhysics,
        padding: padding,
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  final double? topPadding;
  final String? imagePath;
  const _Empty({this.topPadding, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          SizedBox(
            height: topPadding ?? 0,
            width: MediaQuery.of(context).size.width,
          ),
          Lottie.asset(
            imagePath ?? 'assets/lotties/Empty box.json',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16.h),
          CustomText(
            size: 18.sp,
            opacity: FontOpacity.medium,
            text: 'لا توجد بيانات لعرضها',
          ),
        ],
      ),
    );
  }
}

class _Failure extends StatelessWidget {
  final double? topPadding;
  final String? errorMessage;  const _Failure({this.topPadding, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: topPadding ?? 16.h,
        start: 16.w,
        end: 16.w,
        bottom: 16.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Lottie.asset(
            'assets/lotties/Error 404.json',
            width: 200,
            height: 200,
          ),
          CustomText(
            size: 18.sp,
            maxLines: 6,
            opacity: FontOpacity.medium,
            text: errorMessage ?? 'An error occurred while fetching data',
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List items;
  final String? emptyImagePath;
  final Widget Function(dynamic) itemBuilder;
  final void Function(dynamic)? itemTab;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsetsGeometry? padding;
  final double? topPadding;
  const _List({
    required this.items,
    required this.itemBuilder,
    this.emptyImagePath,
    this.itemTab,
    this.scrollPhysics,
    this.padding,
    this.topPadding,
  });

  Widget itemTabBuilder(dynamic item) {
    final child = itemBuilder(item);
    if (itemTab == null) return child;
    return GestureDetector(onTap: () => itemTab!(item), child: child);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _Empty(
        topPadding: topPadding,
        imagePath: emptyImagePath,
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: scrollPhysics,
      padding:
          padding ??
          EdgeInsets.only(top: 10.h, bottom: 80.h, left: 12.w, right: 12.w),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          child: itemTabBuilder(items[index]),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
