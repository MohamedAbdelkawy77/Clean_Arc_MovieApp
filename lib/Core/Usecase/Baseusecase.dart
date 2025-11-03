import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';

abstract class Baseusecase<T, para> {
  Future<Either<Failur, T>> call(para para);
}

class Noparameter extends Equatable {
  Noparameter();
  List<Object?> get props => [];
}
