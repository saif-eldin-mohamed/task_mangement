import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';
import 'package:task_mangment/features/create_task/data/repos/task_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final TaskRepository _taskRepository;
  final Connectivity _connectivity = Connectivity();

  // CreateTaskCubit(this._taskRepository) : super(CreateTaskInitial());
   CreateTaskCubit(this._taskRepository) : super(CreateTaskInitial()) {
    monitorConnectivity(); 
  }
  void monitorConnectivity() {
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        // إذا تم استعادة الاتصال بالإنترنت
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> pendingDeletes = prefs.getStringList('pending_deletes') ?? [];

        // حذف المهام المعلقة عند استعادة الاتصال
        for (String taskId in pendingDeletes) {
          try {
            await _taskRepository.deleteTask(taskId);
            log('Deleted task: $taskId');
          } catch (e) {
            log('Error deleting task: $taskId. Error: $e');
          }
        }

        // مسح قائمة المهام المعلقة
        await prefs.remove('pending_deletes');
      }
    });
  }
  final TextEditingController dueDateController = TextEditingController();
  final  TextEditingController taskTitleController = TextEditingController();
  Future<void> createTask(String title, String date) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(CreateTaskFailure(error: 'لا يوجد اتصال بالإنترنت'));
      return;
    }

    emit(CreateTaskLoading());

    try {
      final task = TaskModel(
        title: title,
        date: date,
        isDone: false,
      );

      final docRef = await _taskRepository.addTask(task);

      final taskWithId = task.copyWith(id: docRef.id);
      log('Document ID: ${docRef.id}');
      await _taskRepository.updateTask(taskWithId);
      emit(CreateTaskSuccess());
      getIt<GetAllTasksCubit>().fetchTasks();
    } catch (e) {
      emit(CreateTaskFailure(error: e.toString()));
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      emit(CreateTaskLoading());
      await _taskRepository.updateTask(task);
      emit(CreateTaskSuccess());
    } catch (e) {
      emit(
        CreateTaskFailure(
          error: (e.toString()),
        ),
      );
    }
  }


Future<void> deleteTask(String taskId) async {
   var connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String> pendingDeletes = prefs.getStringList('pending_deletes') ?? [];

        if (!pendingDeletes.contains(taskId)) {
          pendingDeletes.add(taskId);
          await prefs.setStringList('pending_deletes', pendingDeletes);
        }

        log('Task ID $taskId added to pending deletes.'); 
       if (!isClosed) {
      emit(CreateTaskFailure(error: 'لا يوجد اتصال بالإنترنت. سيتم حذف المهمة عند الاتصال.'));
    }
        return;
      }
    try {
     if (!isClosed) {
      emit(CreateTaskLoading());
    }

      // حذف المهمة مباشرة إذا كان هناك اتصال
      await _taskRepository.deleteTask(taskId); 
      emit(CreateTaskSuccess());
      log('Task ID $taskId deleted successfully.');
    } catch (e) {
      emit(CreateTaskFailure(error: e.toString()));
      log('Error deleting task: $e');
    }
  }
}

