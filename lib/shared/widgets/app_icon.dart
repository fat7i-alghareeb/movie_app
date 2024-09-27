import 'package:flutter/material.dart';
import 'package:movie_app/utils/extensions.dart';

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
      height: context.heightPercentage(6.09),
      width: context.heightPercentage(6.09),
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
