import 'package:flutter/material.dart';

import '../../../../../utils/spacing.dart';
import 'search_success.dart';
import 'search_upper_part.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
  });

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
          const SliverToBoxAdapter(child: SearchUpperPart()),
          sliverVerticalSpace(20),
          SearchSuccessWidget(scrollController: scrollController),
          sliverVerticalSpace(40),
        ],
      ),
    );
  }
}
