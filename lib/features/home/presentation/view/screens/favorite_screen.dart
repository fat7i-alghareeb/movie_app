import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/presentation/manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import 'package:movie_app/features/home/presentation/view/home%20widgets/movie_card.dart';
import 'package:movie_app/shared/cubit/favorite_movies_cubit.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/functions/setup_service_locator.dart';
import 'package:movie_app/utils/spacing.dart';

import '../../../../../shared/widgets/custom_movie_app_bar.dart';
import '../../../../../utils/functions/show_toast.dart';

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
          child: const FavoriteBody(),
        ),
      ),
    );
  }
}

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          sliverVerticalSpace(20),
          const SliverToBoxAdapter(
            child: CustomAppBar(title: "Favorite Movies"),
          ),
          const SliverListView(),
          sliverVerticalSpace(100),
        ],
      ),
    );
  }
}

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
