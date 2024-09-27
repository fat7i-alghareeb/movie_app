import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';

import '../../../../../constants.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        child: Container(
          height: context.heightPercentage(7),
          decoration: BoxDecoration(
            color: context.accentColor(),
            borderRadius: BorderRadius.circular(Constants.kBorderRadius),
          ),
          child: Center(
            child: Text(
              "Add to favorite",
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}
