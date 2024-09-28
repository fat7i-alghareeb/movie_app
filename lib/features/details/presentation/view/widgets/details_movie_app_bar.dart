import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';

import '../../../../../shared/widgets/app_icon.dart';

class DetailMovieAppBar extends StatelessWidget {
  const DetailMovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppIcon(
            widget: Icon(
              Icons.arrow_back_ios_rounded,
              size: 20.w,
            ),
            onPressed: () {
              context.pop();
              HapticFeedback.heavyImpact();
            },
          ),
        ),
        Center(
          child: Text(
            'Detail Movie',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "caveat",
            ),
          ),
        ),
      ],
    );
  }
}
