import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/create_task_button.dart';
import 'package:task_mangment/core/widgets/greeting_header.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/filter_chip_row.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/task_card_list.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/create_task/task_card_list_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          child: BlocProvider(
            create: (context) => getIt<GetAllTasksCubit>()..fetchTasks(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingHeader(),
                SizedBox(height: 20.h),
                const FilterChipRow(),
                SizedBox(height: 20.h),
                const TaskCardListView(),
                const Spacer(),
                const CreateTaskButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
