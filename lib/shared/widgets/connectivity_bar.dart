import 'package:flutter/material.dart';
import 'package:movie_app/utils/extensions.dart';

class ConnectivityBar extends StatefulWidget {
  final bool isOnline;
  final bool checkFirstBuild;
  const ConnectivityBar({
    super.key,
    required this.isOnline,
    this.checkFirstBuild = false,
  });

  @override
  State<ConnectivityBar> createState() => _ConnectivityBarState();
}

class _ConnectivityBarState extends State<ConnectivityBar> {
  bool isVisible = false;
  bool isFirstBuild = true; // Track the first build
  @override
  void didUpdateWidget(covariant ConnectivityBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isFirstBuild && widget.checkFirstBuild) {
      isFirstBuild = false;
      return;
    }
    if (oldWidget.isOnline != widget.isOnline) {
      setState(() {
        isVisible = true;
      });

      if (widget.isOnline) {
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              isVisible = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        width: double.infinity,
        color: widget.isOnline ? Colors.green : Colors.red,
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            widget.isOnline ? "ONLINE" : "OFFLINE",
            style: TextStyle(
              color: context.primaryColor(),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
