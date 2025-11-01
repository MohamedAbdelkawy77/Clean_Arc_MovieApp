// ignore_for_file: public_member_api_docs, sort_constructors_first
 
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/Core/Networking/Constants.dart';
import 'package:movieapp/Core/Networking/GetIt.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchGood_Movies.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchNow_PlayingMovie.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchPopularMovies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieLoading()) {
    on<MovieEventNowPlaying>((event, emit) async {
      emit(MovieLoading());
      var Movies = await getIt<UsecasefetchnowPlayingmovie>().execute();
      Movies.fold((Failur) {
        emit(Moviefailur(failur: Failur.errormessage));
      }, (movies) {
        emit(MovieSuccess(movies: movies));
      });
    });
    on<MovieEventPopularmovies>((event, emit) async {
      emit(MovieLoading());
      var Movies = await getIt<Usecasefetchpopularmovies>().execute();
      Movies.fold((Failur) {
        emit(Moviefailur(failur: Failur.errormessage));
      }, (movies) {
        emit(MovieSuccess(movies: movies));
      });
    });
        on<MovieEventTopmovies>((event, emit) async {
      emit(MovieLoading());
      var Movies = await getIt<UsecasefetchgoodMovies>().execute();
      Movies.fold((Failur) {
        emit(Moviefailur(failur: Failur.errormessage));
      }, (movies) {
        emit(MovieSuccess(movies: movies));
      });
    });
  }
}

// class MovieBloc2 extends Cubit<MovieState> {
//   MovieBloc2() : super(MovieLoading());
//       void  MovieEventNowPlaying() async {
//       emit(MovieLoading());
//       var Movies = await getIt<UsecasefetchnowPlayingmovie>().execute();
//       Movies.fold((Failur) {
//         emit(Moviefailur(failur: Failur.errormessage));
//       }, (movies) {
//         emit(MovieSuccess(movies: movies));
//       });
//     }
// }
