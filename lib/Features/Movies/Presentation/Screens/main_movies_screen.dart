// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/FadeInPopularMovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/FadeInTopratedMovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/FadeinStack.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/RowofTopratedMovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/RowofpopularMovieseemore.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);
  static String id = "/MainMovieScreen";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const Key('movieScrollView'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Fadeinstack(),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: RowofpopularMovieseemore(),
          ),
          FadeInTopratedmovies(),
          Container(
            margin: const EdgeInsets.fromLTRB(
              16.0,
              24.0,
              16.0,
              8.0,
            ),
            child: RowofTopratedMovies(),
          ),
          Fadeinpopularmovies(),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
