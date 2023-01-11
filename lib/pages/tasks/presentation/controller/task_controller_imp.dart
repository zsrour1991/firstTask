

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/pages/tasks/data/data_source/order_report_status_provider/get_task_provider_imp.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/data/repository/task_repository_imp.dart';
import 'package:task_list_app/pages/tasks/domain/usecase/get_task_usecase.dart';

import 'task_controller.dart';
final networkServiceProvider = Provider<TaskControllerImp>((ref) {
  return TaskControllerImp();
});
class TaskControllerImp  implements TaskController {

  final GetTaskUseCase _getTaskUseCase=GetTaskUseCase(TaskRepositoryImp(GetTaskProviderImp()));
  TaskControllerImp();

  @override
 Future<List<TaskModel>> getTask()  async {
 final res = await _getTaskUseCase(GetTaskuseCaseParams());
var r;
    res.fold((error) async {
        return null;
    }, (successData) async {
      r=successData;
     return successData;
    });
  return r;
  }
  }


