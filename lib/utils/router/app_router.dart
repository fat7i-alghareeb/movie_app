import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/details/presentation/manger/details%20book%20cubit/cubit/details_cubit.dart';
import '../functions/setup_service_locator.dart';
import '../../features/details/data/repo/details_repo.dart';
import '../../features/details/presentation/view/details_screen.dart';

import '../../features/dashboards/presentation/view/screens/favorite_screen.dart';
import '../../features/dashboards/presentation/view/screens/home_screen.dart';
import '../../features/dashboards/presentation/view/screens/search_screen.dart';
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
        final String movieId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DetailsMovieCubit(getIt.get<DetailsRepo>())
              ..fetchMovieDetails(movieId: movieId),
            child: DetailsScreen(
              movieId: movieId,
            ),
          ),
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
