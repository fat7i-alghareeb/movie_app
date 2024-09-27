import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.label,
    this.color,
  });

  final String label;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: color ?? context.accentColor().withOpacity(.5),
      side: const BorderSide(
        color: Colors.transparent,
      ),
      label: Text(label),
      labelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
