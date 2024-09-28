import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../utils/router/router_paths.dart';
import '../../../../../utils/spacing.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(KRouter.searchScreen);
        HapticFeedback.heavyImpact();
      },
      child: Container(
        height: context.heightPercentage(6.09),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: context.neutralColor(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: context.heightPercentage(6.09) / 2,
                color: context.onPrimaryColor().withOpacity(0.5),
              ),
              horizontalSpace(10),
              Text(
                "Search",
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: context.onPrimaryColor().withOpacity(0.5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
