import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_mangment/core/routing/app_router.dart';

import 'core/routing/routes.dart';
import 'core/theming/colors.dart';

class TaskAssignmentApp extends StatelessWidget {
  final AppRouter appRouter;
  const TaskAssignmentApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      child: MaterialApp(
        title: ('TaskApp'),
        theme: ThemeData(
            primaryColor: ColorsManager.white,
            scaffoldBackgroundColor: ColorsManager.white),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.createTaskScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
