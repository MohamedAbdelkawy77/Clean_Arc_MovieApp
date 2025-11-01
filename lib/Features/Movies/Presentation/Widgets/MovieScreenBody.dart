import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';

class Moviescreenbody extends StatelessWidget {
  const Moviescreenbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        print(MovieBloc().hashCode);
        return MovieBloc()..add(MovieEventNowPlaying());
      },
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieSuccess) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.movies[0].Title,
                    style: TextStyle(color: Colors.deepPurple),
                  )
                ],
              ),
            );
          } else if (state is Moviefailur) {
            return Column(
              children: [
                Text(
                  state.failur,
                  style: TextStyle(color: Colors.red),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
