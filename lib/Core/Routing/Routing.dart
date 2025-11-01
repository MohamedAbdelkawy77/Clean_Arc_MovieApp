import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Features/Movies/Presentation/Screens/MovieScreen.dart';
import 'package:movieapp/Features/Movies/Presentation/Screens/main_movies_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const Moviescreen();
      },
    ),
    GoRoute(
      path: MainMoviesScreen.id,
      builder: (BuildContext context, GoRouterState state) {
        return const MainMoviesScreen();
      },
    ),
  ],
);
