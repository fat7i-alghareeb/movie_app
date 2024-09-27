import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/data/domain/repo/search_repo.dart';
import 'package:movie_app/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movie_app/features/home/presentation/manger/cubit/home_state.dart';
import 'package:movie_app/features/home/presentation/view/widgets/swiper_widget.dart';
import 'package:movie_app/utils/functions/setup_service_locator.dart';
import 'package:movie_app/utils/functions/show_toast.dart';
import 'package:movie_app/utils/spacing.dart';
import '../../../../shared/widgets/sector_title.dart';
import '../../../../shared/widgets/error_widget.dart';
import 'widgets/home_upper_part.dart';
import 'widgets/movie_card_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
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
          child: BlocProvider(
            create: (context) => HomeCubit(getIt.get<SearchRepo>())
              ..fetchSearchedMovies(searchText: 'star wars'),
            child: const NewestMovieWidget(),
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
          child: MoviesCardListView(
            movies: moviesTest,
          ),
        ),
        sliverVerticalSpace(80),
      ],
    );
  }
}

class NewestMovieWidget extends StatefulWidget {
  const NewestMovieWidget({
    super.key,
  });

  @override
  State<NewestMovieWidget> createState() => _NewestMovieWidgetState();
}

class _NewestMovieWidgetState extends State<NewestMovieWidget> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          movies.addAll(state.searchResponse.movies);
        }

        if (state is HomePaginationFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        }
      },
      builder: (context, state) {
        if (state is HomeSuccess ||
            state is HomePaginationLoading ||
            state is HomePaginationFailure) {
          return SwiperWidget(
            movies: movies,
          );
        } else if (state is HomeFailure) {
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
