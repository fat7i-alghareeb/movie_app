import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../utils/spacing.dart';
import '../../../data/domain/entities/movie_details_entity.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 25.sp,
          ),
        ),
        verticalSpace(10),
        Text(
          "${movie.year}   •   ${movie.genre}   •   ${movie.duration}   •   ${movie.rated}",
          style: TextStyle(
            fontSize: 12.sp,
            color: context.onPrimaryColor().withOpacity(0.5),
          ),
        ),
        verticalSpace(10),
        Text(
          "IMDb: ${movie.rating}",
          style: TextStyle(
            fontSize: 18.sp,
            color: context.accentColor(),
          ),
        ),
      ],
    );
  }
}
