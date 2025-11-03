import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Core/Networking/GetIt.dart';
import 'package:movieapp/Core/Routing/Routing.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MoodThemeCubit/MoodthemeCubit.dart';
import 'package:movieapp/Features/Movies/Presentation/Screens/MovieScreen.dart';

void main() {
  ServerLocator().init();
  runApp(BlocProvider(
    create: (context) => Moodthemecubit(),
    child: MovieApp(),
  ));
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Moodthemecubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          home: Moviescreen(),
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(brightness: state ? Brightness.dark : Brightness.light),
        );
      },
    );
  }
}
