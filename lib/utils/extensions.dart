import 'package:flutter/material.dart';

extension ColorScheme on BuildContext {
  Color primaryColor() => Theme.of(this).colorScheme.primary;
  Color onPrimaryColor() => Theme.of(this).colorScheme.onPrimary;
  Color accentColor() => Theme.of(this).colorScheme.secondary;
  Color neutralColor() => Theme.of(this).colorScheme.tertiary;
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension MediaQueryExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;
  double widthPercentage(double percent) => screenWidth * percent;

  double get screenHeight => screenSize.height;
  double heightPercentage(double percent) => screenHeight * percent;
}
