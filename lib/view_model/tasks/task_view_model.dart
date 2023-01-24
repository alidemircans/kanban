import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kanban/core/di/locator.dart';
import 'package:kanban/helper/app_strings.dart';
import 'package:kanban/model/error_model.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/model/user.dart';
import 'package:kanban/repository/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  //constructure
  TaskViewModel() {
    // we make a service call when this class created!
    getAllTask();
  }

  // get singletion repository for make service call
  TaskServiceRepository service = locator.get<TaskServiceRepository>();

  // all task list
  List<TaskModel> allTask = [];

  // we have 5 user
  List<UserModel> users = [
    const UserModel(
      userName: "Ali Demircan",
    ),
    const UserModel(
      userName: "Veli Demircan",
    ),
    const UserModel(
      userName: "Hasan Demircan",
    ),
    const UserModel(
      userName: "Mehmet Demircan",
    ),
    const UserModel(
      userName: "Kasım Demircan",
    ),
  ];

  // we have 3 type kanban board step
  List<String> steps = [
    AppStrings.todo.toUpperCase(),
    AppStrings.inProgress.toUpperCase(),
    AppStrings.done.toUpperCase(),
  ];

  // get all task from the service
  getAllTask() async {
    final Either<ErrorModel, List<TaskModel>> getAllBankResult =
        await service.getAllTask();

    getAllBankResult.fold((error) {
      print(error.errorName);
    }, (List<TaskModel> tasks) {
      allTask.addAll(tasks);

      notifyListeners();
    });
  }

  // sperate list the all kanban
  List<TaskModel> get getTodoList => allTask
      .where((TaskModel element) => element.kanban == AppStrings.todo)
      .toList();
  List<TaskModel> get getInProgressList => allTask
      .where((TaskModel element) => element.kanban == AppStrings.inProgress)
      .toList();
  List<TaskModel> get getDoneList => allTask
      .where((TaskModel element) => element.kanban == AppStrings.done)
      .toList();

  // change task status
  changeTaskStep(TaskModel task, String newKanban) {
    for (var i in allTask) {
      if (i.id == task.id) {
        // if we have same task with id, it will be change
        i.kanban = newKanban;
        if (newKanban == AppStrings.done) {
          Duration diff = DateTime.now().difference(i.createdDate);
          i.complatedTime = diff.inHours.toString();
        }
      }
    }
    notifyListeners();
  }

  // Assing the task to new user
  changeTaskAssinged(TaskModel task, UserModel newAssigned) {
    for (var i in allTask) {
      if (i.id == task.id) {
        // if we have same task with id, it will be change
        i.assigned = newAssigned;
      }
    }
    notifyListeners();
  }
  // Update task title

  updateTaskTitle(TaskModel task, String title) {
    for (var i in allTask) {
      if (i.id == task.id) {
        // if we have same task with id, it will be change
        i.title = title;
      }
    }
    notifyListeners();
  }

  // add new task to list
  addNewTask(TaskModel task) {
    allTask.add(task);
    notifyListeners();
  }
}
