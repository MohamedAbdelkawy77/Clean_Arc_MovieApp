import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/bloc/moviedetails_bloc.dart';

class Moviedetailsscreen extends StatelessWidget {
  const Moviedetailsscreen({super.key, required this.id});
  static final String Id = "MovieDetailsScreen";
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviedetailsBloc()..add(MoviedetailsEvent(id)),
      child: BlocBuilder<MoviedetailsBloc, MoviedetailsState>(
        builder: (context, state) {
          if (state.movieenumstate == Movieenumstate.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.movieenumstate == Movieenumstate.loaded) {
            return Scaffold(
              body: Text(
                state.movieDetail.title,
                style: TextStyle(fontSize: 100, color: Colors.deepPurple),
              ),
            );
          } else {
            return Text(
              state.errormessage,
              style: TextStyle(fontSize: 100, color: Colors.red),
            );
          }
        },
      ),
    );
  }
}
