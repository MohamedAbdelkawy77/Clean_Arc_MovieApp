import 'package:get_it/get_it.dart';
import 'package:movieapp/Features/Movies/Data/DataSource/RemoteDataSource.dart';
import 'package:movieapp/Features/Movies/Data/RepositoryImplemetation/RepositoryImplementation.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Usecase/UsecaseFetchNow_PlayingMovie.dart';

final getIt = GetIt.instance;

// void setup() {
//   getIt.registerLazySingleton<UsecasefetchnowPlayingmovie>(() =>
//       UsecasefetchnowPlayingmovie(
//           baseRepository:
//               Repositoryimplementation(baseDatasource: RemoteDatasource())));
// }

class ServerLocator {
  void init() {
    getIt.registerLazySingleton<UsecasefetchnowPlayingmovie>(() {
      return UsecasefetchnowPlayingmovie(baseRepository: getIt());
    });
    getIt.registerLazySingleton<Baserepository>(() {
      return Repositoryimplementation(baseDatasource: getIt());
    });
    getIt.registerLazySingleton<BaseRemoteDatasource>(() => RemoteDatasource());
  }
}
