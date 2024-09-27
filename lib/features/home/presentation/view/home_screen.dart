import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../data/domain/entities/movie_entity.dart';
import '../../data/domain/repo/search_repo.dart';
import '../manger/cubit/home_cubit.dart';
import '../manger/cubit/home_state.dart';
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
            create: (context) => SearchCubit(getIt.get<SearchRepo>())
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
