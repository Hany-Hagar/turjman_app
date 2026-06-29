import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../consts/const_assets.dart';


class OnBoardingModel {
  final int id;
  final String buttonTitle;
  final String backgroundImage;

  OnBoardingModel({required this.id, required this.buttonTitle, required this.backgroundImage});

}

List<OnBoardingModel> onBoardingData (BuildContext context) => [
  OnBoardingModel(
      id: 1,
      buttonTitle: S.of(context).onBoardingButton1,
      backgroundImage: ConstAssets.onBoardingBg1),
  OnBoardingModel(
      id: 2,
      buttonTitle: S.of(context).onBoardingButton2,
      backgroundImage: ConstAssets.onBoardingBg2),
  OnBoardingModel(
      id: 3,
      buttonTitle: S.of(context).onBoardingButton3,
      backgroundImage: ConstAssets.onBoardingBg3),
  OnBoardingModel(
      id: 4,
      buttonTitle: S.of(context).onBoardingButton4,
      backgroundImage: ConstAssets.onBoardingBg4),
];