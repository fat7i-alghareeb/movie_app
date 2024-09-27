import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../constants.dart';
import '../../../../../utils/spacing.dart';
import '../../../data/domain/entities/movie_details_entity.dart';
import 'custom_chip.dart';

class StaffWidget extends StatelessWidget {
  const StaffWidget({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
        ),
        color: context.neutralColor(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Director",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              verticalSpace(10),
              CustomChip(label: movie.director),
              verticalSpace(20),
              Text(
                "Cast",
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              verticalSpace(10),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: movie.actors
                    .map(
                      (actor) => CustomChip(label: actor),
                    )
                    .toList(),
              ),
              verticalSpace(10),
            ],
          ),
        ),
      ),
    );
  }
}
