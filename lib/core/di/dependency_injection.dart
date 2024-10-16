import 'package:get_it/get_it.dart';
import 'package:task_mangment/core/networking/firestore_service.dart';
import 'package:task_mangment/features/create_task/data/repos/task_repository.dart';
import 'package:task_mangment/features/create_task/logic/create_task/create_task_cubit.dart';
import 'package:task_mangment/features/create_task/logic/get_all_tasks/get_all_tasks_cubit.dart';


final getIt = GetIt.instance;


Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerLazySingleton<TaskRepository>(() => TaskRepository(getIt<FirestoreService>()));
  getIt.registerFactory<CreateTaskCubit>(() => CreateTaskCubit(getIt<TaskRepository>()));
  getIt.registerFactory<GetAllTasksCubit>(() => GetAllTasksCubit(getIt<TaskRepository>()));
}

