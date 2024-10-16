import 'package:flutter/material.dart';
import 'package:task_mangment/core/widgets/app_text_button.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController taskTitleController;
  final TextEditingController dueDateController;

  const SaveButton({
    super.key,
    required this.taskTitleController,
    required this.dueDateController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
      listener: (context, state) {
        if (state is CreateTaskSuccess) {
          Navigator.pop(context); 
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task created successfully')),
          );
        } else if (state is CreateTaskFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to create task: ${state.error}')),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 55.h,
          child: AppButton(
            buttonText: 'Save Task',
            onPressed: () {
              final taskTitle = taskTitleController.text;
              final dueDate = dueDateController.text;

              if (taskTitle.isNotEmpty && dueDate.isNotEmpty) {
                context.read<CreateTaskCubit>().createTask(taskTitle, dueDate);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill in all fields')),
                );
              }
            },
          ),
        );
      },
    );
  }
}
