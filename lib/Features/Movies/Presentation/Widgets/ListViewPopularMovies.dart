import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Core/Networking/Constants.dart';
import 'package:movieapp/Features/Movies/Domain/Entities/Movie.dart';
import 'package:shimmer/shimmer.dart';

class ListViewPopularMovies extends StatelessWidget {
  const ListViewPopularMovies({
    Key? key,
    required this.movies,
  }) : super(key: key);
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return Container(
          padding: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () {
              /// TODO : NAVIGATE TO  MOVIE DETAILS
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 120.0,
                fit: BoxFit.cover,
                imageUrl: Constants.baseurlimage(imagepath: movie.posterPath),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
