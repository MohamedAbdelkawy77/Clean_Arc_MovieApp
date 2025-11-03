// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Features/Movies/Data/DataSource/RemoteDataSource.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/MovieDetails.dart';

class Repositoryimplementation extends Baserepository {
  BaseRemoteDatasource baseDatasource;
  Repositoryimplementation({
    required this.baseDatasource,
  });
  @override
  Future<Either<Failur, List<Movie>>> FetchGoodMovies() async {
    final Result = await baseDatasource.FetchGoodMovies();
    try {
      return right(Result);
    } on Exceptionserver catch (e) {
      return left(Failur(errormessage: e.errorModel.status_message));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> FetchNowPlayingMovies() async {
    final Result = await baseDatasource.FetchNowPlayingMovies();
    try {
      return right(Result);
    } on Exceptionserver catch (e) {
      return left(Failur(errormessage: e.errorModel.status_message));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> FetchPopularMovies() async {
    final Result = await baseDatasource.FetchPopularMovies();
    try {
      return right(Result);
    } on Exceptionserver catch (e) {
      return left(Failur(errormessage: e.errorModel.status_message));
    }
  }

  @override
  Future<Either<Failur, MovieDetail>> getmoviedetails({required int id}) async {
    MovieDetail movieDetail = await baseDatasource.getMoviedetils(id);
    try {
      return right(movieDetail);
    } on Exceptionserver catch (e) {
      return left(Failur(errormessage: e.errorModel.status_message));
    }
  }

  @override
  Future<Either<Failur, List<MovieDetail>>> getmoviesrecommended(
      {required int id}) {
    // TODO: implement getmoviesrecommended
    throw UnimplementedError();
  }
}
