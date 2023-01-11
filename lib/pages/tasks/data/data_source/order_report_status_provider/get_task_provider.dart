import 'package:flutter/material.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';




abstract class GetTaskProvider {

  Future<List<TaskModel>> getTask();


}
