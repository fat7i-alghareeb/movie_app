import 'package:flutter/material.dart';
import 'package:movie_app/features/details/presentation/view/details_screen.dart';
import 'package:movie_app/features/favorite/presentation/view/favorite_screen.dart';
import 'package:movie_app/features/home/presentation/view/home_screen.dart';
import 'package:movie_app/features/search/presentation/view/search_screen.dart';

import 'router_paths.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KRouter.homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const HomeScreen();
          },
        );
      case KRouter.searchScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const SearchScreen();
          },
        );

      case KRouter.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailsScreen(),
        );

      case KRouter.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const FavoriteScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
