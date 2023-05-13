import 'package:flutter/material.dart';

Widget noInternet({required BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.wifi_off,
        size: 55,
        color: Theme.of(context).colorScheme.error,
      ),
      const SizedBox(height: 15),
      Text(
        "No internet",
        style: Theme.of(context).textTheme.headlineSmall?.merge(
              TextStyle(color: Theme.of(context).colorScheme.error),
            ),
      ),
      const SizedBox(height: 1),
      Text("Check your internet connection",
          style: Theme.of(context).textTheme.bodyMedium),
    ],
  );
}
