import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:movie_app/features/home/presentation/view/home_screen.dart';
import 'package:movie_app/features/home/presentation/view/shimmer.dart';
import 'package:movie_app/utils/extensions.dart';
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
    final double height = context.heightPercentage(25);
    late bool isLoading = false;

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
                .read<HomeCubit>()
                .fetchSearchedMovies(
                  pageNumber: ++Constants.famousMoviePageNumber,
                  searchText: "star wars",
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
              borderRadius: Constants.kBorderRadius,
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
              // context
              //     .getCubit<RecentViewedBooksCubit>()
              //     .addToRecentView(movies[index]);
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
