import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/shared/widgets/custom_image.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/spacing.dart';

import 'widgets/search_upper_part.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const SafeArea(
          child: SearchBody(),
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: CustomScrollView(
        slivers: [
          const SearchUpperPart(),
          sliverVerticalSpace(20),

          //NumberOfResults(),
          // SliverSizedBox(height: 20),
          // SearchStates(),
        ],
      ),
    );
  }
}
