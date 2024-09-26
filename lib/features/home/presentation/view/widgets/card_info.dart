import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../constants.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.containerWidth,
    required this.height,
    required this.movie,
  });

  final double containerWidth;
  final double height;
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 5,
      shadowColor: context.accentColor().withOpacity(.05),
      child: Container(
        height: height,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          color: context.accentColor().withOpacity(.1),
        ),
      ),
    );
  }
}
