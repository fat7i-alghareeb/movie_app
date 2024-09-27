import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants.dart';
import '../../../../utils/extensions.dart';
import 'widgets/add_to_favorite_button.dart';
import 'widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: DetailsBody(
                movie: detailsTest,
              ),
            ),
            const Gradient(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.w, vertical: 20.h),
              child: const AddToFavoriteButton(),
            )
          ],
        ),
      ),
    );
  }
}

class Gradient extends StatelessWidget {
  const Gradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                context.primaryColor().withOpacity(0.6),
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
