import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../shared/cubit/favorite cubit/favorite_movies_cubit.dart';
import '../../../../../utils/functions/show_toast.dart';
import '../home widgets/movie_card.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(30);

    return BlocConsumer<FavoriteMoviesCubit, FavoriteMoviesState>(
      listener: (context, state) {
        if (state is FavoriteMoviesFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        }
      },
      builder: (context, state) {
        return SliverList.builder(
          itemBuilder: (context, index) {
            return MovieCard(
              height: height,
              movie: context.read<FavoriteMoviesCubit>().movies[index],
              containerWidth: double.infinity,
            );
          },
          itemCount: context.read<FavoriteMoviesCubit>().movies.length,
        );
      },
    );
  }
}
