import 'package:flutter/material.dart';
import 'package:task_mangment/core/routing/routes.dart';
import '../../features/create_task/presentation/create_task_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.createTaskScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateTaskScreen(),
        );
      default:
        return null;
    }
  }
}
