import 'package:flutter/material.dart';
import 'package:kanban/helper/routes.dart';

class SplashViewModel extends ChangeNotifier {
  onInit(context) async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.TASK_PAGE, (Route<dynamic> route) => false);
  }
}
