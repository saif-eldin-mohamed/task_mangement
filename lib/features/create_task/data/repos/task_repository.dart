import 'package:task_mangment/core/networking/firestore_service.dart';
import 'package:task_mangment/features/create_task/data/models/task_model.dart';

class TaskRepository {
  final FirestoreService _firestoreService;

  TaskRepository(this._firestoreService);

  Future<void> addTask(TaskModel task) async {
    await _firestoreService.addTask(
      collectionPath: 'tasks',
      data: task.toJson(),
    );
  }

Stream<List<TaskModel>> getTasks() {
  return _firestoreService
      .getTask(collectionPath: 'tasks', field: 'date')
      .map((snapshot) => snapshot.docs
          .map((doc) => TaskModel.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList());
}


  Future<void> deleteTask(String taskId) async {
    await _firestoreService.deleteTask(
      collectionPath: 'tasks',
      docId: taskId,
    );
  }
}
