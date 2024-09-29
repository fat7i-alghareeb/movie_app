import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/router/router_paths.dart';
import '../../../../../constants.dart';
import '../../../data/domain/entities/movie_entity.dart';
import '../../manger/search cubit/search_cubit.dart';
import '../../manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../../../../../shared/widgets/shimmer.dart';
import '../../../../../utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../shared/widgets/custom_image.dart';

class SwiperWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final bool showShimmer;
  const SwiperWidget({
    super.key,
    required this.movies,
    this.showShimmer = false,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(30.h);
    bool isLoading = false;

    return SizedBox(
      height: height.h,
      child: Swiper(
        index: (Constants.famousMoviePageNumber - 1) * 10 + 1,
        loop: false,
        viewportFraction: 0.54,
        scale: 0.6,
        itemCount: showShimmer ? 5 : movies.length + 1,
        onIndexChanged: (index) async {
          if (index >= movies.length && !isLoading) {
            isLoading = true;

            await context
                .read<SearchCubit>()
                .fetchPaginationMovies(
                  pageNumber: ++Constants.famousMoviePageNumber,
                )
                .whenComplete(
              () async {
                isLoading = false;
              },
            );
          }
        },
        itemBuilder: (context, index) {
          if (showShimmer) {
            return ShimmerWidget(
              height: height,
              borderRadius: Constants.borderRadius,
            );
          }
          if (index == movies.length) {
            if (!isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.accentColor(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }

          return GestureDetector(
            onTap: () {
              context
                  .read<RecentViewedMoviesCubit>()
                  .addToRecentView(movies[index]);
              context.pushNamed(
                KRouter.detailsScreen,
                arguments: movies[index].id,
              );
              HapticFeedback.heavyImpact();
            },
            child: Column(
              children: [
                Expanded(
                  child: Builder(builder: (context) {
                    return CustomImage(image: movies[index].poster);
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
