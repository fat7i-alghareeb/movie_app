import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/router/router_paths.dart';
import '../../../data/domain/entities/movie_entity.dart';
import '../../../../../shared/widgets/custom_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/spacing.dart';
import '../../../../../constants.dart';
import '../../manger/recent_viewed_books_cubit/cubit/recent_viewed_books_cubit.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.height,
    required this.movie,
    required this.containerWidth,
  });
  final double height;
  final MovieEntity movie;
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RecentViewedMoviesCubit>().addToRecentView(movie);
        context.pushNamed(
          KRouter.detailsScreen,
          arguments: movie.id,
        );
        HapticFeedback.heavyImpact();
      },
      child: SizedBox(
        height: height,
        width: containerWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: height * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.borderRadius),
                color: context.accentColor().withOpacity(.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: (height * .75).w,
                    child: CustomImage(image: movie.poster),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(50),
                        Expanded(
                          child: Text(
                            movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${movie.type}  •  ${movie.year}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: context.onPrimaryColor().withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
