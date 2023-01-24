import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kanban/core/network/dio_client.dart';
import 'package:kanban/helper/app_strings.dart';
import 'package:kanban/model/error_model.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/model/user.dart';
import 'package:kanban/service/base/task_service_base.dart';

class TaskService extends TaskServiceBaseClass {
  final DioClient dioClient;
  TaskService({required this.dioClient});

  @override
  Future<Either<ErrorModel, List<TaskModel>>> getAllTask() async {
    if (true) {
      List<TaskModel> tasks = [
        TaskModel(
          title: "1 Add given json of events in the DB on Firebase",
          kanban: AppStrings.todo.toUpperCase(),
          assigned: const UserModel(userName: "Ali Demircan"),
          id: UniqueKey().toString().substring(1, 7),
          createdDate: DateTime.now(),
          complatedTime: "",
        ),
        TaskModel(
          title: "2 Add given json of events in the DB on Firebase",
          kanban: AppStrings.inProgress.toUpperCase(),
          assigned: const UserModel(userName: "Veli Demircan"),
          id: UniqueKey().toString().substring(1, 7),
          createdDate: DateTime.now(),
          complatedTime: "",
        ),
        TaskModel(
          title: "3 Add given json of events in the DB on Firebase",
          kanban: AppStrings.done.toUpperCase(),
          assigned: const UserModel(userName: "Kasım Demircan"),
          id: UniqueKey().toString().substring(1, 7),
          createdDate: DateTime.now(),
          complatedTime: "",
        ),
      ];
      return right(tasks);
    } else {
      return left(
        const ErrorModel(
          errorName: "Error",
          errorDescription: "",
        ),
      );
    }
  }
}
