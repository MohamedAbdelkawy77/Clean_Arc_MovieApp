import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';

class Moviemodel extends Movie {
  const Moviemodel(
      {required super.Id,
      required super.Title,
      required super.overview,
      required super.posterPath,
      required super.voteAverage});

  factory Moviemodel.fromJson(Map<String, dynamic> Data) {
    return Moviemodel(
        Id: Data["id"],
        Title: Data["title"],
        overview: Data["overview"],
        posterPath: Data["poster_path"],
        voteAverage: Data["vote_average"].toDouble());
  }
}
