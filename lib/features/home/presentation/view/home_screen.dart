import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/presentation/view/widgets/swiper_widget.dart';
import 'package:movie_app/utils/spacing.dart';
import '../../../../shared/widgets/sector_title.dart';
import 'widgets/home_upper_part.dart';
import 'widgets/movie_card_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: true,
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
          padding: true,
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
