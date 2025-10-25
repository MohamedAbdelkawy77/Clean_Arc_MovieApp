import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class UsecasefetchnowPlayingmovie {
  final Baserepository baseRepository;

  UsecasefetchnowPlayingmovie({required this.baseRepository});
  Future<List<Movie>> execute() async{
    return await baseRepository.FetchNowPlayingMovies();
  }
}
