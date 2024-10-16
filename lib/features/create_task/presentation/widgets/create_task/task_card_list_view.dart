import 'package:flutter/material.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/task_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCardListView extends StatelessWidget {
  const TaskCardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
      builder: (context, state) {
        if (state is GetAllTasksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllTasksLoaded) {
          return SizedBox(
            height: 400.h,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.tasks.length,
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return TaskCardList(tasks: task);
              },
            ),
          );
        } else if (state is GetAllTasksError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('No tasks available'));
      },
    );
  }
}
