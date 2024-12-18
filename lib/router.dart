import 'package:go_router/go_router.dart';
import 'package:jav_lib_app/src/views/actress/index.dart';
import 'package:jav_lib_app/src/views/home/movie_detail.dart';

import 'src/components/layouts/bottom_bar_layout.dart';
import 'src/views/favorites/index.dart';
import 'src/views/home/index.dart';
import 'src/views/login/index.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
      path: '/',
      builder: (context, state) => const BottomBarLayout(
            currentTab: 0,
          ),
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: 'movie_detail',
          name: 'movie_detail',
          builder: (context, state) => const MovieDetailPage(),
        ),
        GoRoute(
          path: 'actress',
          builder: (context, state) => const ActressPage(),
        ),
        GoRoute(
          path: 'favorites',
          builder: (context, state) => const FavoritesPage(),
        ),
      ]),
]);
