import 'package:flutter/material.dart';
import '../../utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.widget,
    required this.onPressed,
    this.color,
  });
  final Widget widget;
  final void Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.dg,
      width: 55.dg,
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          shape: const CircleBorder(),
          color: color ?? context.neutralColor(),
          elevation: 0,
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }
}
