import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class Usecasefetchpopularmovies {
  final Baserepository baseRepository;

  Usecasefetchpopularmovies({required this.baseRepository});
  Future<List<Movie>> movies() async{
    return await baseRepository.FetchPopularMovies();
  }
}
