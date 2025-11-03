// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'moviedetails_bloc.dart';

class MoviedetailsState extends Equatable {
  const MoviedetailsState(
      {this.movieDetail = const MovieDetail(
          backdropPath: "",
          genreIds: [],
          id: 90,
          overview: "overview",
          releaseDate: "releaseDate",
          runtime: 120,
          title: "title",
          voteAverage: 6),
      this.errormessage = "",
      this.movieenumstate = Movieenumstate.loading,
      this.category = ""});
  final MovieDetail movieDetail;
  final String errormessage;
  final Movieenumstate movieenumstate;
  final String category;
  @override
  List<Object> get props =>
      [movieDetail, category, movieenumstate, errormessage];

  MoviedetailsState copyWith({
    MovieDetail? movieDetail,
    String? errormessage,
    Movieenumstate? movieenumstate,
    String? category,
  }) {
    return MoviedetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      errormessage: errormessage ?? this.errormessage,
      movieenumstate: movieenumstate ?? this.movieenumstate,
      category: category ?? this.category,
    );
  }
}
