import 'custom_divider.dart';
import 'theme_switch.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;

    return Drawer(
      width: x * .7,
      child: const SafeArea(
        child: Column(
          children: [
            CustomDivider(dividerName: "Settings"),
            Padding(
              padding: EdgeInsets.all(15),
              child: ThemeSwitch(),
            ),
          ],
        ),
      ),
    );
  }
}
