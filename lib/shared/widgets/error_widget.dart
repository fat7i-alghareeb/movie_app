import 'package:flutter/material.dart';
import 'package:movie_app/utils/extensions.dart';

class OnFetchErrorWidget extends StatelessWidget {
  const OnFetchErrorWidget({
    super.key,
    required this.errorMessage,
    this.onRetry,
  });
  final String errorMessage;
  final void Function()? onRetry;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red[700],
              size: 45,
            ),
            Text(
              'Oops!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.accentColor(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
