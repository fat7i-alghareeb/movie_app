import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/presentation/view/widgets/swiper_widget.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/home_upper_part.dart';
import 'widgets/movie_card_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(context.screenHeight.toString());
    log(context.screenWidth.toString());
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeUpperPart(),
        sliverVerticalSpace(30),
        const SectorTitle(
          boldText: "Now ",
          normalText: "showing",
        ),
        sliverVerticalSpace(20),
        SliverToBoxAdapter(
          child: SwiperWidget(
            movies: moviesTest,
          ),
        ),
        sliverVerticalSpace(30),
        const SectorTitle(
          boldText: "Recent ",
          normalText: "viewed",
        ),
        sliverVerticalSpace(20),
        SliverToBoxAdapter(
          child: MoviesCardListView(
            movies: moviesTest,
          ),
        )
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 20.w, right: 20.w),
        //     child: Image.asset(
        //       AssetsImages.ad,
        //       height: context.heightPercentage(23.8),
        //       fit: BoxFit.contain,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

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
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
      ),
    );
  }
}
