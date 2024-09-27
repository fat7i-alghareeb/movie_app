import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';

class SectorTitle extends StatelessWidget {
  const SectorTitle({
    super.key,
    required this.boldText,
    required this.normalText,
  });
  final String boldText;
  final String normalText;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: RichText(
        text: TextSpan(
          text: boldText,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
            color: context.onPrimaryColor(),
          ),
          children: [
            TextSpan(
              text: normalText,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
