import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {
  static TextStyle font30Black900Medium = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black900,
  );
  static TextStyle font20Black900Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.black900,
  );
  static TextStyle font13WhiteMedium = TextStyle(
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.medium,
    fontSize: 13.sp,
  );
  static TextStyle font15WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontWeight: FontWeightHelper.bold,
    fontSize: 15.sp,
  );
}
