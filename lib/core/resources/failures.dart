import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  int error;

  Failure(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}