import 'package:flutter/material.dart';

class LaureateWidget extends StatelessWidget {
  final String motivation;
  final String firstname;
  final String surname;

  const LaureateWidget({
    super.key,
    required this.motivation,
    this.firstname = "",
    this.surname = "",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(motivation, textAlign: TextAlign.justify),
          ),
          Card(
            color: Theme.of(context).colorScheme.inverseSurface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$firstname $surname",
                style: TextStyle(color: Theme.of(context).colorScheme.onInverseSurface),
              ),
            ),
          )
        ],
      ),
    );
  }
}
