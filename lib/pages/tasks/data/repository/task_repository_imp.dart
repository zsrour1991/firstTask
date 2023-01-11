
import 'package:dartz/dartz.dart';
import 'package:task_list_app/pages/tasks/data/model/task_model.dart';
import 'package:task_list_app/pages/tasks/domain/repository/task_repository.dart';

class TaskRepositoryImp implements TaskRepository {
  final getTaskProvider ;
  TaskRepositoryImp(this.getTaskProvider);

  @override
  Future<Either<dynamic,List<TaskModel>>> getTask()
  async{
    var result;
    try{
      result = await getTaskProvider.getTask();
      return Right(result);
    }catch(e){
      return Left(result);
    }



  }
}