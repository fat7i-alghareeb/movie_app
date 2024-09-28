import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/spacing.dart';
import '../../../../../../shared/widgets/app_icon.dart';
import 'home_search_widget.dart';

class HomeUpperPart extends StatelessWidget {
  const HomeUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " CineVerse",
                  style: TextStyle(
                    fontFamily: "caveat",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: context.accentColor(),
                  ),
                ),
                AppIcon(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                    HapticFeedback.heavyImpact();
                  },
                  widget: Icon(
                    Icons.menu,
                    size: 20.dg,
                    color: context.onPrimaryColor().withOpacity(0.5),
                  ),
                )
              ],
            ),
            verticalSpace(20),
            const HomeSearchWidget()
          ],
        ),
      ),
    );
  }
}
