import 'package:get_it/get_it.dart';
import 'package:movieapp/Features/Movies/Data/DataSource/RemoteDataSource.dart';
import 'package:movieapp/Features/Movies/Data/RepositoryImplemetation/RepositoryImplementation.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchGood_Movies.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchNow_PlayingMovie.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchPopularMovies.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseMoviedetials.dart';

final getIt = GetIt.instance;

// void setup() {
//   getIt.registerLazySingleton<UsecasefetchnowPlayingmovie>(() =>
//       UsecasefetchnowPlayingmovie(
//           baseRepository:
//               Repositoryimplementation(baseDatasource: RemoteDatasource())));
// }

class ServerLocator {
  void init() {
    getIt.registerLazySingleton<Usecasemoviedetials>(() {
      return Usecasemoviedetials(baserepository: getIt());
    });

    getIt.registerLazySingleton<UsecasefetchnowPlayingmovie>(() {
      return UsecasefetchnowPlayingmovie(baseRepository: getIt());
    });
    getIt.registerLazySingleton<UsecasefetchgoodMovies>(() {
      return UsecasefetchgoodMovies(baseRepository: getIt());
    });
    getIt.registerLazySingleton<Usecasefetchpopularmovies>(() {
      return Usecasefetchpopularmovies(baseRepository: getIt());
    });
    getIt.registerLazySingleton<Baserepository>(() {
      return Repositoryimplementation(baseDatasource: getIt());
    });
    getIt.registerLazySingleton<BaseRemoteDatasource>(() => RemoteDatasource());
  }
}
