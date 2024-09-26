import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/shared/widgets/custom_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/spacing.dart';
import '../../../../../constants.dart';

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
      onTap: () {},
      child: SizedBox(
        width: containerWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: height * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.kBorderRadius),
                color: context.accentColor().withOpacity(.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Hero(
                        tag: movie.id,
                        child: CustomImage(image: movie.poster),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                      verticalSpace(20),
                      Text(
                        "${movie.type}  •  ${movie.year}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: context.onPrimaryColor().withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
