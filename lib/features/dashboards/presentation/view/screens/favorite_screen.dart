import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../../../../../shared/cubit/favorite%20cubit/favorite_movies_cubit.dart';
import '../../../../../shared/cubit/connectivity cubit/connectivity_cubit.dart';
import '../../../../../shared/widgets/connectivity_bar.dart';
import '../favorite widgets/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FavoriteMoviesCubit()..fetchFavoriteMovies(),
            ),
            BlocProvider(
              create: (context) => RecentViewedMoviesCubit(),
            ),
          ],
          child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
            builder: (context, state) {
              bool isOnline = state is ConnectivityOnline;
              return Stack(
                children: [
                  const FavoriteBody(),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ConnectivityBar(isOnline: isOnline),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
