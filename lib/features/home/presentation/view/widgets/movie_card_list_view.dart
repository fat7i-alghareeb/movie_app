import '../../../data/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../../../../../utils/extensions.dart';

class MoviesCardListView extends StatefulWidget {
  const MoviesCardListView({
    super.key,
    required this.movies,
  });
  final List<MovieEntity> movies;

  @override
  State<MoviesCardListView> createState() => _MoviesCardListViewState();
}

class _MoviesCardListViewState extends State<MoviesCardListView> {
  late final ScrollController _scrollController;

  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.9 * maxScrollLength) {
      if (!isLoading) {
        // isLoading = true;
        // await context
        //     .getCubit<NewestBooksCubit>()
        //     .fetchNewestBooks(pageNumber: ++Constants.newestPageNumber)
        //     .whenComplete(() => isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(30);
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: widget.movies.length + 1,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == widget.movies.length) {
            return SizedBox(
              width: 200,
              child: Center(
                child: CircularProgressIndicator(
                  color: context.accentColor(),
                ),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieCard(
              height: height,
              movie: widget.movies[index],
              containerWidth: context.widthPercentage(75),
            ),
          );
        },
      ),
    );
  }
}
