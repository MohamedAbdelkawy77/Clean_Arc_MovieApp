import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/Features/Movies/Presentation/Screens/MovieScreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const Moviescreen();
      },
    ),
  ],
);
