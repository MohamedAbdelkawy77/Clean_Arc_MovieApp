part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieEventNowPlaying extends MovieEvent {}

class MovieEventTopmovies extends MovieEvent {}

class MovieEventPopularmovies extends MovieEvent {}
