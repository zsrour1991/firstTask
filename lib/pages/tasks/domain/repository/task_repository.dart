import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';

abstract class TaskRepository{
  Future<Either<dynamic,List<TaskModel>>> getTask();
}