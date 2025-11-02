import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/ListViewPopularMovies.dart';

class Fadeinpopularmovies extends StatelessWidget {
  const Fadeinpopularmovies({super.key});

  @override
  Widget build(BuildContext context) {
    print("Fadeinpopularmovies");
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (prev, curr) => curr.Category == MoviesCategory.popular,
      //    buildWhen: (prev, curr) => prev.movieenumstate != curr.movieenumstate,
      builder: (context, state) {
        if (state.movieenumstate == Movieenumstate.loading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.cyanAccent,
          ));
        } else if (state.movieenumstate == Movieenumstate.loaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListViewPopularMovies(
                movies: state.Movies,
              ),
            ),
          );
        } else if (state.movieenumstate == Movieenumstate.isempty) {
          return Center(
              child: Text(
            state.ErrorMessage,
            style: TextStyle(color: Colors.red),
          ));
        } else {
          return Center(
              child: Text(
            "Unexpected Method",
            style: TextStyle(color: Colors.red),
          ));
        }
      },
    );
  }
}
