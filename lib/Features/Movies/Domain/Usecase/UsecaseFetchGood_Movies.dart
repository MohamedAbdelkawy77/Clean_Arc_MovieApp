import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class UsecasefetchgoodMovies {
  final Baserepository baseRepository;

  UsecasefetchgoodMovies({required this.baseRepository});
  Future<List<Movie>> execute() async{
    return await baseRepository.FetchGoodMovies();
  }
}
