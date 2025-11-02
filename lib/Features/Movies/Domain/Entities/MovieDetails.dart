import 'package:equatable/equatable.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/geners.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final List<Gener> genreIds;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
