part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class Moviefailur extends MovieState {
  final String failur;

  const  Moviefailur({required this.failur});
}

final class MovieSuccess extends MovieState {
  final List<Movie> movies;

  const  MovieSuccess({required this.movies});
}
