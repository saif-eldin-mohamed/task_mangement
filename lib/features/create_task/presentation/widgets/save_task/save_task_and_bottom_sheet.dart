import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/theming/styles.dart';
import 'package:task_mangment/core/widgets/app_text_field.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/close_button.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/save_button.dart';

class SaveTaskBottomSheet extends StatefulWidget {
  const SaveTaskBottomSheet({super.key});

  @override
  _SaveTaskBottomSheetState createState() => _SaveTaskBottomSheetState();
}

class _SaveTaskBottomSheetState extends State<SaveTaskBottomSheet> {
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController taskTitleController = TextEditingController();

  @override
  void dispose() {
    dueDateController.dispose();
    taskTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CloseButtonWidget(),
          Text(
            'Create New Task',
            style: TextThemes.font20Black900Bold,
          ),
          SizedBox(height: 20.h),
          AppTextField(
            labelText: 'Task Title',
            controller: taskTitleController,
          ),
          SizedBox(height: 15.h),
          AppTextField(
            labelText: 'Due Date',
            controller: dueDateController,
            keyboardType: TextInputType.datetime,
          ),
          SizedBox(height: 30.h),
          SaveButton(
            taskTitleController: taskTitleController,
            dueDateController: dueDateController,
          ),
        ],
      ),
    );
  }
}
