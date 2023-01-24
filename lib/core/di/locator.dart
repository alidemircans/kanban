import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban/core/network/dio_client.dart';
import 'package:kanban/repository/task_repository.dart';
import 'package:kanban/service/task_service.dart';
import 'package:kanban/view_model/tasks/task_view_model.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(Dio());
  locator.registerLazySingleton<TaskViewModel>(() => TaskViewModel());
  locator.registerSingleton(DioClient(locator<Dio>()));
  locator.registerLazySingleton(
      () => TaskService(dioClient: DioClient(locator<Dio>())));
  locator.registerLazySingleton(
      () => TaskServiceRepository(locator.get<TaskService>()));

  //locator.registerLazySingleton(() => SharedPreferencesServices());
}
