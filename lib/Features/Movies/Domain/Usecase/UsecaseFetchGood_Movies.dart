import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Core/Usecase/Baseusecase.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class UsecasefetchgoodMovies extends Baseusecase <List<Movie>,Noparameter> {
  final Baserepository baseRepository;

  UsecasefetchgoodMovies({required this.baseRepository});
  Future<Either<Failur, List<Movie>>>  call(Noparameter nopa) async{
    return await baseRepository.FetchGoodMovies();
  }
}
