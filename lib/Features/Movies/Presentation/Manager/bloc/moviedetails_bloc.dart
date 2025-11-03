import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/Core/Networking/GetIt.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/MovieDetails.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseMoviedetials.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';

part 'moviedetails_event.dart';
part 'moviedetails_state.dart';

class MoviedetailsBloc extends Bloc<MoviedetailsEvent, MoviedetailsState> {
  MoviedetailsBloc() : super(MoviedetailsState()) {
    on<MoviedetailsEvent>((event, emit) async {
    var movieDetail = await getIt<Usecasemoviedetials>().call(event.id);
    movieDetail.fold((Fail) {
      emit(state.copyWith(
          category: "Movidetails",
          movieenumstate: Movieenumstate.isempty,
          errormessage: Fail.errormessage));
    }, (movie) {
      emit(state.copyWith(
          category: "Movidetails",
          movieenumstate: Movieenumstate.loaded,
          movieDetail: movie));
    });
  });
  }

  // void getmovieDetails() {
  //   return on<MoviedetailsEvent>((event, emit) async {
  //   var movieDetail = await getIt<Usecasemoviedetials>().call(id);
  //   movieDetail.fold((Fail) {
  //     emit(state.copyWith(
  //         category: "Movidetails",
  //         movieenumstate: Movieenumstate.isempty,
  //         errormessage: Fail.errormessage));
  //   }, (movie) {
  //     emit(state.copyWith(
  //         category: "Movidetails",
  //         movieenumstate: Movieenumstate.loaded,
  //         movieDetail: movie));
  //   });
  // });
  // }
}
