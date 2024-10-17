import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/theming/styles.dart';
import 'package:task_mangment/core/widgets/app_text_button.dart';
import 'package:task_mangment/core/widgets/app_text_field.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/close_button.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/save_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateTaskAndBottomSheet extends StatefulWidget {
  const UpdateTaskAndBottomSheet({super.key, required this.task});
  final TaskModel task;

  @override
  _UpdateTaskAndBottomSheetState createState() => _UpdateTaskAndBottomSheetState();
}

class _UpdateTaskAndBottomSheetState extends State<UpdateTaskAndBottomSheet> {
 
 

  late TextEditingController dueDateController;
  late TextEditingController taskTitleController;

  @override
  void initState() {
    super.initState();
    // تهيئة المتحكمات
    dueDateController = TextEditingController(text: widget.task.date);
    taskTitleController = TextEditingController(text: widget.task.title);
  }

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
            'UpdateTask',
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
          AppButton(buttonText: 'Update Task', onPressed: (){
             final updatedTask =  widget.task.copyWith(
                      title: taskTitleController.text,
                      date: dueDateController.text,
                    );
                    context.read<CreateTaskCubit>().updateTask(updatedTask);
                     ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task updated successfully')),
          );
                    Navigator.pop(context); 
          }),
        ],
      ),
    );
  }
}
