// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Core/Networking/Constants.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/ColumnoverthemainMovie.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/ListViewPopularMovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/ListViewofTopratedmovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/RowofTopratedMovies.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/RowofpopularMovieseemore.dart';
//import 'package:movies_apps/core/network/api_constance.dart';
//import 'package:movies_apps/movies/presentation/screens/dummy.dart';


class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);
  static String id = "/MainMovieScreen";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MovieSuccess) {
          return SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {},
                    ),
                    items: state.movies.map(
                      (item) {
                        return GestureDetector(
                          key: const Key('openMovieMinimalDetail'),
                          onTap: () {
                            /// TODO : NAVIGATE TO MOVIE DETAILS
                          },
                          child: Stack(
                            children: [
                              ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      // fromLTRB
                                      Colors.transparent,
                                      Colors.black,
                                      Colors.black,
                                      Colors.transparent,
                                    ],
                                    stops: [0, 0.3, 0.5, 1],
                                  ).createShader(
                                    Rect.fromLTRB(
                                        0, 0, rect.width, rect.height),
                                  );
                                },
                                blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                  height: 560.0,
                                  imageUrl: Constants.baseurlimage(
                                      imagepath: item.posterPath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ColumnoverthemainMovie(
                                  Title: item.Title,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: RowofpopularMovieseemore(),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 170.0,
                    child: ListViewofTopratedmovies(
                      movies: state.movies,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: RowofTopratedMovies(),
                ),
                FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 170.0,
                    child: ListViewPopularMovies(
                      movies: state.movies,
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          );
        } else if (state is Moviefailur) {
          return Center(
              child: Text(
            state.failur,
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


 

