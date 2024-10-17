
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/core/theming/colors.dart';

import 'package:task_mangment/core/widgets/app_text_button.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/presentation/widgets/update_task/update_task_and_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NoDoneScreen extends StatelessWidget {
  const NoDoneScreen({super.key, required this.task});
final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.h,
        left: 20.w,
        right: 20.w,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(child: AppButton(onPressed: (){
          _showCreateTaskBottomSheet(context);
        },buttonText: 'Ubdate',),),
        SizedBox(width: 10.w,),
        Expanded(child: AppButton(onPressed: () async{
           context.read<CreateTaskCubit>().deleteTask(task.id!);
          // _deleteTask(context, task.id);
        },buttonText: 'Delete',),),
        ],
      ),
    );
 
  }
   
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
              child:   UpdateTaskAndBottomSheet(task:task ,),
          ),),
        );
      },
    );
  }
}