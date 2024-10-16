import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'task_card_widget.dart';
class TaskCardList extends StatelessWidget {
  final TaskModel tasks;
  const TaskCardList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskCardWidget(
          title: tasks.title,
          dueDate: tasks.date,
          isDone: false,
        ),
        SizedBox(height: 10.h),        
      ],
    );
  }
}
