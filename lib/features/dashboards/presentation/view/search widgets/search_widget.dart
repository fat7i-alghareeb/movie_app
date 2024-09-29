import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/assets.dart';
import '../../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _searchController = TextEditingController();
  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _searchController.text.length == 1 || _searchController.text.isEmpty
        ? setState(() {})
        : null;
  }

  Widget _cancelWidget() {
    return _searchController.text.isEmpty
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => _searchController.clear(),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: const Center(
                child: Text("Cancel"),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _searchController,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
              child: SvgPicture.asset(
                AssetsImages.search,
                height: 15.dg,
                colorFilter: ColorFilter.mode(
                  context.onPrimaryColor(),
                  BlendMode.srcIn,
                ),
              ),
            ),
            hintText: "Enter movie name",
          ),
        ),
        _cancelWidget(),
      ],
    );
  }
}
