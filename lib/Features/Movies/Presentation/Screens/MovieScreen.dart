import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MoodThemeCubit/MoodthemeCubit.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MovieBloc/movie_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Screens/main_movies_screen.dart';

class Moviescreen extends StatefulWidget {
  const Moviescreen({super.key});

  @override
  State<Moviescreen> createState() => _MoviescreenState();
}

class _MoviescreenState extends State<Moviescreen> {
  @override
  Widget build(BuildContext context) {
    
    print("main build");
    return BlocProvider(
      create: (context) => MovieBloc()
        ..add(MovieEventNowPlaying())
        ..add(MovieEventPopularmovies())
        ..add(MovieEventTopmovies()),
      child: BlocBuilder<Moodthemecubit, bool>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<Moodthemecubit>().changeMood();
                      },
                      icon: state
                          ? Icon(Icons.light_mode)
                          : Icon(Icons.dark_mode)),
                ],
              ),
              body: MainMoviesScreen());
        },
      ),
    );
  }
}
