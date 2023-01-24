import 'package:dartz/dartz.dart';
import 'package:kanban/base/base_task_service.dart';
import 'package:kanban/model/error_model.dart';
import 'package:kanban/model/task.dart';
import 'package:kanban/service/task_service.dart';

class TaskServiceRepository implements BaseTaskService {
  final TaskService taskService;

  TaskServiceRepository(this.taskService);

  @override
  Future<Either<ErrorModel, List<TaskModel>>> getAllTask() async {
    return await taskService.getAllTask();
  }
}
