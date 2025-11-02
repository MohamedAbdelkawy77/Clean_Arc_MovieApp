import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';

abstract class Baseusecase <T>{

Future<Either<Failur,T>>call();

}