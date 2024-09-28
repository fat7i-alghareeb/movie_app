import '../../../data/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../../../../../utils/extensions.dart';

class MoviesCardListView extends StatelessWidget {
  const MoviesCardListView({
    super.key,
    required this.movies,
    required this.scrollController,
  });
  final List<MovieEntity> movies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(30);
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: movies.length,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieCard(
              height: height,
              movie: movies[index],
              containerWidth: context.widthPercentage(80),
            ),
          );
        },
      ),
    );
  }
}
