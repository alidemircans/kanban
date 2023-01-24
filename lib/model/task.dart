import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban/model/user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@unfreezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required UserModel assigned,
    required String title,
    required String kanban,
    required String id,
    required DateTime createdDate,
    required String complatedTime,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
