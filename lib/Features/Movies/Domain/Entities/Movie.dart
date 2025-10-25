// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int Id;
  final String Title;
  final String overview;
  final String posterPath;
  final double voteAverage;

  const Movie(
      {required this.Id,
      required this.Title,
      required this.overview,
      required this.posterPath,
      required this.voteAverage});

  @override
  List<Object> get props {
    return [
      Id,
      Title,
    ];
  }
}
