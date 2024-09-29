import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/dashboards/presentation/manger/search%20cubit/search_cubit.dart';
import 'package:movie_app/utils/extensions.dart';
import '../../../../../constants.dart';
import '../../../../../shared/widgets/sector_title.dart';
import '../../../../../utils/functions/setup_service_locator.dart';
import '../../../../../utils/spacing.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import 'famous_movies.dart';
import 'home_upper_part.dart';
import 'recent_viewed_movies.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  Future<void> _onRefresh(BuildContext context) async {
    await context
        .read<SearchCubit>()
        .fetchSearchedMovies(searchText: randomMovie);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: context.neutralColor(),
      color: context.accentColor(),
      onRefresh: () => _onRefresh(context),
      child: CustomScrollView(
        slivers: [
          const HomeUpperPart(),
          sliverVerticalSpace(30),
          const SliverToBoxAdapter(
            child: SectorTitle(
              boldText: "Famous ",
              normalText: "franchises",
              padding: true,
            ),
          ),
          sliverVerticalSpace(20),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt.get<RecentViewedMoviesCubit>(),
              child: const FamousMovieWidget(),
            ),
          ),
          sliverVerticalSpace(30),
          const SliverToBoxAdapter(
            child: SectorTitle(
              boldText: "Recent ",
              normalText: "viewed",
              padding: true,
            ),
          ),
          sliverVerticalSpace(20),
          SliverToBoxAdapter(
            child: BlocProvider(
              create: (context) => getIt.get<RecentViewedMoviesCubit>()
                ..fetchRecentViewedMovies(),
              child: const RecentViewedMovies(),
            ),
          ),
          sliverVerticalSpace(80),
        ],
      ),
    );
  }
}
