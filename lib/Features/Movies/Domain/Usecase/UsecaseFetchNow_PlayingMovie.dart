import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class UsecasefetchnowPlayingmovie {
  final Baserepository baseRepository;

  UsecasefetchnowPlayingmovie({required this.baseRepository});
  Future<Either<Failur, List<Movie>>> execute() async{
    return await baseRepository.FetchNowPlayingMovies();
  }
}
