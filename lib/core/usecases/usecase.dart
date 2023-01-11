import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


abstract class UseCase<Type, Params> {
  Future<Either<dynamic, Type>> call(Params params);
}

class NoParams {}