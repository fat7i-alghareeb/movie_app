import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/extensions.dart';

class SectorTitle extends StatelessWidget {
  const SectorTitle({
    super.key,
    required this.boldText,
    required this.normalText,
    this.padding = false,
  });
  final String boldText;
  final String normalText;
  final bool padding;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding
            ? EdgeInsets.only(left: 20.w, right: 20.w)
            : EdgeInsets.zero,
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
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
