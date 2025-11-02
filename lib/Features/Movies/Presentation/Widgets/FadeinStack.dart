import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Core/Networking/Constants.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Widgets/ColumnoverthemainMovie.dart';

class Fadeinstack extends StatelessWidget {
  const Fadeinstack({super.key});

  @override
  Widget build(BuildContext context) {
  print("Fadeinstack");
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
      current.Category == MoviesCategory.nowplaying,
      // buildWhen: (prev, curr) => prev.movieenumstate != curr.movieenumstate,
      builder: (context, state) {
        if (state.movieenumstate == Movieenumstate.loading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.amber,
          ));
        } else if (state.movieenumstate == Movieenumstate.loaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: state.Movies.map(
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
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
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
