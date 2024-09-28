import 'package:flutter/material.dart';
import 'pagination_vertical_list_view.dart';

class SearchSuccessWidget extends StatefulWidget {
  const SearchSuccessWidget({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<SearchSuccessWidget> createState() => _SearchSuccessWidgetState();
}

class _SearchSuccessWidgetState extends State<SearchSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: PaginationListVerticalView(
      scrollController: widget.scrollController,
    ));
  }
}
