import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/widgets/filter_chip_widget.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterChipRow extends StatelessWidget {
  const FilterChipRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
      builder: (context, state) {
        return Row(
          children: [
            FilterChipWidget(
              label: 'All',
              isSelected: true, // Implement logic for selection
              onSelected: (selected) {
                // Implement filter logic
              },
            ),
            SizedBox(width: 10.w),
            FilterChipWidget(
              label: 'Not Done',
              isSelected: false, // Implement logic for selection
              onSelected: (selected) {
                // Implement filter logic
              },
            ),
            SizedBox(width: 10.w),
            FilterChipWidget(
              label: 'Done',
              isSelected: false, // Implement logic for selection
              onSelected: (selected) {
                // Implement filter logic
              },
            ),
          ]
        );
      },
    );
  }
}

// TaskModel (unchanged)

// CreateTaskCubit
