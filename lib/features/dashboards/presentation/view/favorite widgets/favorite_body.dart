import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/widgets/custom_movie_app_bar.dart';
import '../../../../../utils/spacing.dart';
import 'sliver_list_view.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomScrollView(
        slivers: [
          sliverVerticalSpace(20),
          const SliverToBoxAdapter(
            child: CustomAppBar(title: "Favorite Movies"),
          ),
          const SliverListView(),
          sliverVerticalSpace(100),
        ],
      ),
    );
  }
}
