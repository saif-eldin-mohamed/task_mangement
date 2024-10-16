import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/core/theming/colors.dart';
import 'package:task_mangment/core/widgets/app_text_button.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/save_task_and_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: AppButton(
        buttonText: 'Create Task',
        onPressed: () {
          _showCreateTaskBottomSheet(context);
        },
      ),
    );
  }

  // Function to show the bottom sheet
  void _showCreateTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ColorsManager.transparent,
      builder: (context) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            color: ColorsManager.white,
            child: BlocProvider(
              // Use GetIt to provide CreateTaskCubit
              create: (context) => getIt<CreateTaskCubit>(),
              child:  SaveTaskBottomSheet(),
            ),
          ),
        );
      },
    );
  }
}
