import 'package:flutter/material.dart';
import 'package:kanban/core/di/locator.dart';
import 'package:kanban/helper/routes.dart';
import 'package:kanban/view/onborading/splash_view.dart';
import 'package:kanban/view/tasks/tasks_view.dart';
import 'package:kanban/view_model/onborading/splash_view_model.dart';
import 'package:kanban/view_model/tasks/task_view_model.dart';
import 'package:provider/provider.dart';

class RoutesManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH_PAGE:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider<SplashViewModel>(
                create: (context) => SplashViewModel(),
              ),
            ],
            child: const SplashView(),
          ),
        );
      case Routes.TASK_PAGE:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: locator<TaskViewModel>(),
              ),
            ],
            child: const TasksView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Ups !'),
            ),
          ),
        );
    }
  }
}
