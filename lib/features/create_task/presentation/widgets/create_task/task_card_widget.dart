import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/theming/app_assets.dart';
import 'package:task_mangment/core/theming/colors.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String dueDate;
  final bool isDone;

  const TaskCardWidget({
    super.key,
    required this.title,
    required this.dueDate,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.black900.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Due Date: $dueDate',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
            width: 25.w,
            child: Opacity(
              opacity: isDone ? 1.0 : 0.35,
              child: Image.asset(
                AppAssets.iconsDoneRound,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
