import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../shared/widgets/sector_title.dart';
import '../../../../../utils/spacing.dart';
import '../../../data/domain/entities/movie_details_entity.dart';
import 'details_upper_part.dart';
import 'staff_widget.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.movie,
  });
  final MovieDetailsEntity movie;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverVerticalSpace(30),
        DetailsUpperPart(movie: movie),
        sliverVerticalSpace(30),
        const SectorTitle(
          boldText: "Plot ",
          normalText: "summary",
        ),
        sliverVerticalSpace(10),
        SliverToBoxAdapter(
          child: Text(
            movie.plot,
            style: TextStyle(
              fontSize: 12.sp,
              color: context.onPrimaryColor().withOpacity(0.5),
            ),
          ),
        ),
        sliverVerticalSpace(30),
        const SectorTitle(boldText: "Given ", normalText: "awards"),
        sliverVerticalSpace(10),
        SliverToBoxAdapter(
          child: Text(
            movie.awards,
            style: TextStyle(
              fontSize: 12.sp,
              color: context.onPrimaryColor().withOpacity(0.5),
            ),
          ),
        ),
        sliverVerticalSpace(30),
        const SectorTitle(boldText: "Top ", normalText: "staff"),
        sliverVerticalSpace(10),
        StaffWidget(movie: movie),
        sliverVerticalSpace(100),
      ],
    );
  }
}
