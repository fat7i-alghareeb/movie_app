import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final List<double> paddingLTRB;
  final double? height;
  final double? width;
  final double borderRadius;
  const ShimmerWidget({
    super.key,
    this.paddingLTRB = const [0, 0, 0, 0],
    this.height,
    this.width,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLTRB[0], paddingLTRB[1], paddingLTRB[2], paddingLTRB[3]),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.grey[600]?.withOpacity(0.7),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
