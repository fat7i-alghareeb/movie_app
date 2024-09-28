import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/functions/setup_service_locator.dart';

import '../../../../../constants.dart';
import '../../../../../utils/functions/show_toast.dart';
import '../../../data/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import '../../manger/search cubit/search_cubit.dart';
import '../../manger/search cubit/search_state.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../home widgets/movie_card.dart';
import '../../../../../utils/extensions.dart';

class PaginationListVerticalView extends StatefulWidget {
  const PaginationListVerticalView({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  State<PaginationListVerticalView> createState() =>
      _PaginationListVerticalViewState();
}

class _PaginationListVerticalViewState
    extends State<PaginationListVerticalView> {
  bool isLoading = false;
  bool hasMoreData = true;
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (!hasMoreData) return;
    var currentPositions = widget.scrollController.position.pixels;
    var maxScrollLength = widget.scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.95 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await context
            .read<SearchCubit>()
            .fetchPaginationMovies(
                pageNumber: ++Constants.searchedMoviesPageNumber)
            .whenComplete(
              () => isLoading = false,
            );
      }
    }
  }

  List<MovieEntity> movies = [];
  String totalResults = "0";
  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(30);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          movies = context.read<SearchCubit>().movies;
          hasMoreData = context.read<SearchCubit>().hasMoreData;
          totalResults = state.searchResponse.totalResults ?? "0";
        } else if (state is SearchPaginationFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        } else if (state is SearchFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        } else if (state is SearchPaginationEnd) {
          hasMoreData = false;
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess ||
            state is SearchPaginationFailure ||
            state is SearchPaginationLoading) {
          return ListView.builder(
            itemCount: movies.length + 1,
            controller: widget.scrollController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$totalResults Results Found",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: context.onPrimaryColor().withOpacity(.5),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }
              if (index == movies.length && isLoading) {
                return SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.accentColor(),
                    ),
                  ),
                );
              } else if (index == movies.length) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocProvider(
                  create: (context) => getIt.get<RecentViewedMoviesCubit>(),
                  child: MovieCard(
                    height: height,
                    movie: movies[index - 1],
                    containerWidth: context.widthPercentage(80),
                  ),
                ),
              );
            },
          );
        } else if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: context.accentColor(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
