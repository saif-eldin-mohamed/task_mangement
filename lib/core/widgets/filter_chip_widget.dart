import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/theming/colors.dart';
import 'package:task_mangment/core/theming/styles.dart';
// FilterChipWidget Implementation
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool)? onSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected?.call(!isSelected),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.green600
              : ColorsManager.green600.withOpacity(.1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: TextThemes.font13WhiteMedium.copyWith(
            color: isSelected ? ColorsManager.white : ColorsManager.green600,
          ),
        ),
      ),
    );
  }
}