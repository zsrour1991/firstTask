import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/data/repository/task_repository_imp.dart';

class GetTaskUseCase extends UseCase<
    List<TaskModel>, GetTaskuseCaseParams> {
  TaskRepositoryImp taskRepositoryImp ;

  GetTaskUseCase(this.taskRepositoryImp);

  @override
  Future<Either<dynamic, List<TaskModel>>> call(
      GetTaskuseCaseParams params) {
    return taskRepositoryImp.getTask();
  }
}

class GetTaskuseCaseParams {

  GetTaskuseCaseParams();
}
final getTaskuseCaseParams = Provider((_) => GetTaskuseCaseParams());