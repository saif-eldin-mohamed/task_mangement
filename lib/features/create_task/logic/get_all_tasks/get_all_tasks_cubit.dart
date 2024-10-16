import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/data/repos/task_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'get_all_tasks_state.dart';
class GetAllTasksCubit extends Cubit<GetAllTasksState> {
  final TaskRepository _taskRepository;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<TaskModel>>? _tasksSubscription;

  GetAllTasksCubit(this._taskRepository) : super(GetAllTasksInitial());

  void fetchTasks() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(GetAllTasksError(error: 'لا يوجد اتصال بالإنترنت'));
      return;
    }

    emit(GetAllTasksLoading());

    _tasksSubscription?.cancel();
    _tasksSubscription = _taskRepository.getTasks().listen(
      (tasks) {
        emit(GetAllTasksLoaded(tasks));
      },
      onError: (error) {
        emit(GetAllTasksError(error: error.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}