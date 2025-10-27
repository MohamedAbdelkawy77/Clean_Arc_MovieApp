// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/Features/Movies/Data/DataSource/RemoteDataSource.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class Repositoryimplementation extends Baserepository {
  BaseRemoteDatasource baseDatasource;
  Repositoryimplementation({
    required this.baseDatasource,
  });
  @override
  Future<List<Movie>> FetchGoodMovies() {
    return baseDatasource.FetchGoodMovies();
  }

  @override
  Future<List<Movie>> FetchNowPlayingMovies() {
    return baseDatasource.FetchNowPlayingMovies();
  }

  @override
  Future<List<Movie>> FetchPopularMovies() {
    return baseDatasource.FetchPopularMovies();
  }
}
