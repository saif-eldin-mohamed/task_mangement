import 'package:bloc/bloc.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/data/repos/task_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final TaskRepository _taskRepository;
  final Connectivity _connectivity = Connectivity();

  CreateTaskCubit(this._taskRepository) : super(CreateTaskInitial());

  Future<void> createTask(String title, String date) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(CreateTaskFailure(error: 'لا يوجد اتصال بالإنترنت'));
      return;
    }

    emit(CreateTaskLoading());

    try {
      final task = TaskModel(
        id: '', // Firestore will generate an ID
        title: title,
        date: date,
        isDone: false,
      );

      await _taskRepository.addTask(task);
      emit(CreateTaskSuccess());
      
      // Trigger a refresh of the task list
      getIt<GetAllTasksCubit>().fetchTasks();
    } catch (e) {
      emit(CreateTaskFailure(error: e.toString()));
    }
  }
}