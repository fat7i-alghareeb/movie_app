import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../shared/widgets/app_icon.dart';
import '../../../../../../utils/assets.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/spacing.dart';
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
    return Row(
      children: [
        AppIcon(
          widget: SvgPicture.asset(
            AssetsImages.backArrow,
            height: 13.dg,
            colorFilter: ColorFilter.mode(
              context.onPrimaryColor().withOpacity(.5),
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            context.pop();
            HapticFeedback.heavyImpact();
          },
        ),
        horizontalSpace(10),
        const Expanded(
          child: SearchWidget(),
        ),
      ],
    );
  }
}
