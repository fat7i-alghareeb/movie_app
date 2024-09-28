import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/error_widget.dart';
import '../../../../../utils/functions/show_toast.dart';
import '../../../data/domain/entities/movie_entity.dart';
import '../../manger/search cubit/search_cubit.dart';
import '../../manger/search cubit/search_state.dart';
import 'swiper_widget.dart';

class FamousMovieWidget extends StatefulWidget {
  const FamousMovieWidget({
    super.key,
  });

  @override
  State<FamousMovieWidget> createState() => _FamousMovieWidgetState();
}

class _FamousMovieWidgetState extends State<FamousMovieWidget> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          movies.addAll(state.searchResponse.movies ?? []);
        }

        if (state is SearchPaginationFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess ||
            state is SearchPaginationLoading ||
            state is SearchPaginationFailure) {
          return SwiperWidget(
            movies: movies,
          );
        } else if (state is SearchFailure) {
          return OnFetchErrorWidget(
            errorMessage: state.message,
            onRetry: () => context.read<SearchCubit>().fetchSearchedMovies(
                  searchText: "Mission: Impossible",
                ),
          );
        } else {
          return SwiperWidget(
            movies: movies,
            showShimmer: true,
          );
        }
      },
    );
  }
}
