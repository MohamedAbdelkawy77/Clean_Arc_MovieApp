part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {}

class MovieEventNowPlaying extends MovieEvent {
  final List<Movie> nowplayingMovies;
  final String errormessage;
  final Movieenum movieenum;

  MovieEventNowPlaying(
      {this.nowplayingMovies = const [],
      this.errormessage = "",
      this.movieenum = Movieenum.loaded});

  @override
  List<Object> get props => [nowplayingMovies, errormessage];
}
