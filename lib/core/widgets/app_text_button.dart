import 'package:flutter/material.dart';
import 'package:task_mangment/core/theming/colors.dart';
import 'package:task_mangment/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.backgroundColor, 
    this.textStyle,       
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorsManager.green600, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          buttonText,
          style: textStyle ?? TextThemes.font15WhiteBold, 
        ),
      ),
    );
  }
}
