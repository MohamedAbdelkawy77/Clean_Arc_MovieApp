import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Core/Usecase/Baseusecase.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class UsecasefetchnowPlayingmovie extends Baseusecase <List<Movie>,Noparameter> {
  final Baserepository baseRepository;

  UsecasefetchnowPlayingmovie({required this.baseRepository});
  Future<Either<Failur, List<Movie>>>  call(Noparameter no) async{
    return await baseRepository.FetchNowPlayingMovies();
  }
}
