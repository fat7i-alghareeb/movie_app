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
    required this.animation,
  });
  final MovieDetailsEntity movie;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        sliverVerticalSpace(20),
        SliverToBoxAdapter(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 2),
              end: Offset.zero,
            ).animate(animation),
            child: DetailsUpperPart(movie: movie),
          ),
        ),
        SliverToBoxAdapter(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 2),
              end: Offset.zero,
            ).animate(animation),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                verticalSpace(30),
                const SectorTitle(
                  boldText: "Plot ",
                  normalText: "summary",
                ),
                verticalSpace(10),
                Text(
                  movie.plot,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: context.onPrimaryColor().withOpacity(0.5),
                  ),
                ),
                verticalSpace(30),
                const SectorTitle(boldText: "Given ", normalText: "awards"),
                verticalSpace(10),
                Text(
                  movie.awards,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: context.onPrimaryColor().withOpacity(0.5),
                  ),
                ),
                verticalSpace(30),
                const SectorTitle(boldText: "Top ", normalText: "staff"),
                verticalSpace(10),
                StaffWidget(movie: movie),
              ],
            ),
          ),
        ),
        sliverVerticalSpace(100),
      ],
    );
  }
}
