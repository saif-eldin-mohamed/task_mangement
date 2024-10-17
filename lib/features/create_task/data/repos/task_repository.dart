import 'package:task_mangment/core/networking/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';

class TaskRepository {
  final FirestoreService _firestoreService;

  TaskRepository(this._firestoreService);

  Future<DocumentReference> addTask(TaskModel task) async {
  return  await _firestoreService.addTask(
      collectionPath: 'tasks',
      data: task.toJson(),
    );
  }

Stream<List<TaskModel>> getTasks() {
  return _firestoreService
      .getTask(collectionPath: 'tasks', field: 'date')
      .map((snapshot) => snapshot.docs
          .map((doc) => TaskModel.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: doc.id))
          .toList());
}


  Future<void> deleteTask(String taskId) async {
    await _firestoreService.deleteTask(
      collectionPath: 'tasks',
      docId: taskId,
    );
  }
  Future<void> updateTask(TaskModel task) async {
    await _firestoreService.updateTask(
      collectionPath: 'tasks',
      docId: task.id!,
      data: task.toJson(),
    );
  }
}
