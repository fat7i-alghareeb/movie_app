import 'package:flutter/material.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../shared/widgets/custom_image.dart';
import '../../../../../utils/spacing.dart';
import '../../../data/domain/entities/movie_details_entity.dart';
import '../../../../../shared/widgets/custom_movie_app_bar.dart';
import 'main_details.dart';

class DetailsUpperPart extends StatelessWidget {
  const DetailsUpperPart({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const CustomAppBar(
            title: 'Detail Movie',
          ),
          verticalSpace(20),
          SizedBox(
            height: context.heightPercentage(43),
            child: CustomImage(
              image: movie.poster,
            ),
          ),
          verticalSpace(25),
          MainDetails(movie: movie)
        ],
      ),
    );
  }
}
