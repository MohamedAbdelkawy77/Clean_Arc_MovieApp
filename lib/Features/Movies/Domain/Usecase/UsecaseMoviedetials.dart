// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:movieapp/Core/Errors/ExceptionServer.dart';
import 'package:movieapp/Core/Usecase/Baseusecase.dart';
import 'package:movieapp/Features/Movies/Domain/BaseRepository/BaseRepository.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/MovieDetails.dart';

class Usecasemoviedetials extends Baseusecase<MovieDetail,int> {
  final Baserepository baserepository;
  Usecasemoviedetials({
    required this.baserepository,
  });

  @override
  Future<Either<Failur, MovieDetail>> call(int id) async {
    return await baserepository.getmoviedetails(id:id);
  }
}
