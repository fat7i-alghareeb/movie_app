import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants.dart';

import '../../../../../shared/widgets/sector_title.dart';
import '../../../../../utils/functions/setup_service_locator.dart';
import '../../../../../utils/spacing.dart';
import '../../../data/domain/repo/search_repo.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../../manger/search cubit/search_cubit.dart';
import 'famous_movies.dart';
import 'home_upper_part.dart';
import 'recent_viewed_movies.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeUpperPart(),
        sliverVerticalSpace(30),
        const SliverToBoxAdapter(
          child: SectorTitle(
            boldText: "Famous ",
            normalText: "movies",
            padding: true,
          ),
        ),
        sliverVerticalSpace(20),
        SliverToBoxAdapter(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SearchCubit(getIt.get<SearchRepo>())
                  ..fetchSearchedMovies(searchText: Constants.randomMovie),
              ),
              BlocProvider(
                create: (context) => getIt.get<RecentViewedMoviesCubit>(),
              ),
            ],
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
            create: (context) =>
                getIt.get<RecentViewedMoviesCubit>()..fetchRecentViewedMovies(),
            child: const RecentViewedMovies(),
          ),
        ),
        sliverVerticalSpace(80),
      ],
    );
  }
}
