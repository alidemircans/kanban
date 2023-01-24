import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban/core/di/locator.dart';
import 'package:kanban/helper/app_strings.dart';
import 'package:kanban/helper/routes_manager.dart';

void mainCommon() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const KanbanApp());
}

class KanbanApp extends StatelessWidget {
  const KanbanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MaterialApp(
          onGenerateRoute: RoutesManager.generateRoute,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
        );
      },
    );
  }
}
