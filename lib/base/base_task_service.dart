import 'package:dartz/dartz.dart';
import 'package:kanban/model/error_model.dart';
import 'package:kanban/model/task.dart';

abstract class BaseTaskService {
  Future<Either<ErrorModel, List<TaskModel>>> getAllTask();
}
