import 'package:flutter/material.dart';
import 'package:task_mangment/core/di/dependency_injection.dart';
import 'package:task_mangment/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/task_assigment_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();

  setupDependencyInjection();

  runApp(TaskAssignmentApp(
    appRouter: AppRouter(),
  ));
}
