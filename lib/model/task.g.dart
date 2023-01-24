// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      assigned: UserModel.fromJson(json['assigned'] as Map<String, dynamic>),
      title: json['title'] as String,
      kanban: json['kanban'] as String,
      id: json['id'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      complatedTime: json['complatedTime'] as String,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      'assigned': instance.assigned,
      'title': instance.title,
      'kanban': instance.kanban,
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
      'complatedTime': instance.complatedTime,
    };
