import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../shared/widgets/app_icon.dart';
import '../../../../../../utils/assets.dart';
import 'search_widget.dart';

class SearchUpperPart extends StatefulWidget {
  const SearchUpperPart({
    super.key,
  });

  @override
  State<SearchUpperPart> createState() => _SearchUpperPartState();
}

class _SearchUpperPartState extends State<SearchUpperPart> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          AppIcon(
            widget: SvgPicture.asset(
              AssetsImages.backArrow,
              height: 15.dg,
              colorFilter: ColorFilter.mode(
                context.onPrimaryColor(),
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              HapticFeedback.heavyImpact();
            },
          ),
          horizontalSpace(10),
          const Expanded(
            child: SearchWidget(),
          ),
        ],
      ),
    );
  }
}
