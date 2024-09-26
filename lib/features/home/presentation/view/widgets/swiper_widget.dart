import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../shared/widgets/custom_image.dart';

class SwiperWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const SwiperWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final double height = context.heightPercentage(25);
    late bool isLoading = false;

    return SizedBox(
      height: height.h,
      child: Swiper(
        index: 1, //(Constants.trendingBooksPageNumber - 1) * 10 + 1,
        onIndexChanged: (index) async {
          // if (index >= movies.length - 2 && !isLoading) {
          //   isLoading = true;
          //   await context
          //       .getCubit<TrendingBooksCubit>()
          //       .fetchTrendingBooks(
          //         pageNumber: ++Constants.trendingBooksPageNumber,
          //       )
          //       .whenComplete(
          //         () => isLoading = false,
          //       );
          // }
        },
        loop: false,
        viewportFraction: 0.54,
        scale: 0.6,
        itemCount: movies.length + 1,
        itemBuilder: (context, index) {
          if (index == movies.length) {
            if (!isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.accentColor(),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
          return GestureDetector(
            onTap: () {
              // context
              //     .getCubit<RecentViewedBooksCubit>()
              //     .addToRecentView(movies[index]);
            },
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: movies[index].id,
                    child: Builder(builder: (context) {
                      return CustomImage(image: movies[index].poster);
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
