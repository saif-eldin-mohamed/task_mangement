import 'package:flutter/material.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/core/theming/colors.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/choose_update_and_delete/no_done_screen.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/task_card_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/save_task/save_task_and_bottom_sheet.dart';

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
                return GestureDetector(
                  onTap: () {
                    _showCreateTaskBottomSheet(context,task);
                  },
                  child: TaskCardList(tasks: task),);
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
  void _showCreateTaskBottomSheet(BuildContext context ,TaskModel task) {
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
              child:  NoDoneScreen(task: task,),
            ),
          ),
        );
      },
    );
  }

}
