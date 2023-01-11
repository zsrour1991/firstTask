

import 'package:task_list_app/pages/tasks/data/model/task_model.dart';

abstract class TaskController{


  Future<List<TaskModel>> getTask();


}