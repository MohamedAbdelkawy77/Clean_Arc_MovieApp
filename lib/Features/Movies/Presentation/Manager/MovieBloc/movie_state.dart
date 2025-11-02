part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState(
      {this.Movies = const [],
      this.Category = MoviesCategory.noone,
      this.ErrorMessage = "",
      this.movieenumstate = Movieenumstate.loading});
  final List<Movie> Movies;
  final Movieenumstate movieenumstate;
  final String ErrorMessage;
  final MoviesCategory Category;

  @override
  List<Object> get props => [Movies, Category, ErrorMessage, movieenumstate];
}

enum Movieenumstate { loading, loaded, isempty }

enum MoviesCategory {  noone, nowplaying, popular, toprated }

// final class MovieInitial extends MovieState {}

// final class MovieLoading extends MovieState {}

// final class Moviefailur extends MovieState {
//   final String failur;

//   const  Moviefailur({required this.failur});
// }

// final class MovieSuccess extends MovieState {
//   final List<Movie> movies;

//   const  MovieSuccess({required this.movies});
// }
