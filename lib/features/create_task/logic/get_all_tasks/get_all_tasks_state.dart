part of 'get_all_tasks_cubit.dart';


@immutable
abstract class GetAllTasksState {}

class GetAllTasksInitial extends GetAllTasksState {}

class GetAllTasksLoading extends GetAllTasksState {}

class GetAllTasksLoaded extends GetAllTasksState {
  final List<TaskModel> tasks;

  GetAllTasksLoaded(this.tasks);
}

class GetAllTasksError extends GetAllTasksState {
  final String error;

  GetAllTasksError({required this.error});
}

