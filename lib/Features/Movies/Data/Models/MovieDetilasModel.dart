import 'package:movieapp/Features/Movies/Domain/Entities/MovieDetails.dart';

class Moviedetilsmodel extends MovieDetail {
  Moviedetilsmodel(
      {required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage});
  factory Moviedetilsmodel.tpJson(Map<String, dynamic> data) {
    return Moviedetilsmodel(
        backdropPath: data["backdrop_path"],
        genreIds: data["genres"],
        id: data["id"],
        overview: data["overview"],
        releaseDate: data["release_date"],
        runtime: data["runtime"],
        title: data["title"],
        voteAverage: data["vote_average"]);
  }
}
