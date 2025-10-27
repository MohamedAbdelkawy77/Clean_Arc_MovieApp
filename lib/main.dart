import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Core/Routing/Routing.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MoodThemeCubit/MoodthemeCubit.dart';

void main() {
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
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme:
              ThemeData(brightness: state ? Brightness.dark : Brightness.light),
        );
      },
    );
  }
}
