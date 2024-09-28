import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/router/router_paths.dart';
import '../../data/domain/entities/movie_entity.dart';
import '../../data/domain/repo/search_repo.dart';
import '../manger/cubit/search_cubit.dart';
import '../manger/cubit/search_state.dart';
import '../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../manger/recent_viewed_books_cubit/recent_viewed_movies_state.dart';
import 'widgets/swiper_widget.dart';
import '../../../../utils/functions/setup_service_locator.dart';
import '../../../../utils/functions/show_toast.dart';
import '../../../../utils/spacing.dart';
import '../../../../shared/widgets/sector_title.dart';
import '../../../../shared/widgets/error_widget.dart';
import 'widgets/home_upper_part.dart';
import 'widgets/movie_card_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.accentColor(),
        onPressed: () {
          context.pushNamed(KRouter.favoriteScreen);
          HapticFeedback.heavyImpact();
        },
        child: Icon(
          Icons.favorite,
          color: context.primaryColor(),
        ),
      ),
      body: const SafeArea(
        child: HomeBody(),
      ),
    );
  }
}

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
        const SectorTitle(
          boldText: "Famous ",
          normalText: "movies",
          padding: true,
        ),
        sliverVerticalSpace(20),
        SliverToBoxAdapter(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SearchCubit(getIt.get<SearchRepo>())
                  ..fetchSearchedMovies(searchText: "harry potter"),
              ),
              BlocProvider(
                create: (context) => getIt.get<RecentViewedMoviesCubit>(),
              ),
            ],
            child: const FamousMovieWidget(),
          ),
        ),
        sliverVerticalSpace(30),
        const SectorTitle(
          boldText: "Recent ",
          normalText: "viewed",
          padding: true,
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
          movies.addAll(state.searchResponse.movies);
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
            onRetry: () {},
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
