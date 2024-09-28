import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extensions.dart';

import 'app_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
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
            title,
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
