import 'package:doc_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontWeights {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class TextStyles {
  static TextStyle font26BlackBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeights.bold,
    color: ColorsManager.black,
  );

  static TextStyle font36BlueBold = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeights.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeights.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font12GreyRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeights.regular,
    color: ColorsManager.grey,
  );

  static TextStyle font14GreyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeights.regular,
    color: ColorsManager.grey,
  );

  static TextStyle font14Grey50Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeights.medium,
    color: ColorsManager.grey50,
  );

  static TextStyle font14DarkGreyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeights.medium,
    color: ColorsManager.darkGrey,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeights.semiBold,
    color: Colors.white,
  );
}
