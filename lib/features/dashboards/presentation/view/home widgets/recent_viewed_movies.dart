import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/functions/show_toast.dart';
import '../../../data/domain/entities/movie_entity.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_movies_state.dart';
import 'movie_card_list_view.dart';

class RecentViewedMovies extends StatefulWidget {
  const RecentViewedMovies({
    super.key,
  });

  @override
  State<RecentViewedMovies> createState() => _RecentViewedMoviesState();
}

class _RecentViewedMoviesState extends State<RecentViewedMovies> {
  late final ScrollController scrollController;

  late List<MovieEntity> movies;
  @override
  void initState() {
    scrollController = ScrollController();
    movies = context.read<RecentViewedMoviesCubit>().movies;
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _jumpToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentViewedMoviesCubit, RecentViewedMoviesState>(
      listener: (context, state) {
        if (state is RecentViewedMoviesSuccess) {
          movies = context.read<RecentViewedMoviesCubit>().movies;
          _jumpToTop();
        }
        if (state is RecentViewedMoviesFailure) {
          showToast(message: state.errorMessage, color: Colors.red[700]);
        }
      },
      builder: (context, state) => MoviesCardListView(
        movies: movies.reversed.toList(),
        scrollController: scrollController,
      ),
    );
  }
}
