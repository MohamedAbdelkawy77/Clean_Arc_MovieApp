import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

abstract class Baserepository {
  Future<Either<Failur, List<Movie>>> FetchNowPlayingMovies();
  Future<Either<Failur, List<Movie>>>FetchPopularMovies();
  Future<Either<Failur, List<Movie>>> FetchGoodMovies();
}

// Movie moviemodel1 = Moviemodel(
//     Id: 1,
//     Title: "Title",
//     overview: "overview",
//     posterPath: "posterPath",
//     voteAverage: 2);

// Moviemodel moviemodel2 = Moviemodel(
//     Id: 1,
//     Title: "Title",
//     overview: "overview2",
//     posterPath: "posterPath",
//     voteAverage: 2);
// void main() {
//   print(moviemodel1 == moviemodel2);
// }
