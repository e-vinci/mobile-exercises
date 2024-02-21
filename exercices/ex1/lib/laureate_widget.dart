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
    return Column(
      children: [
        Text(motivation),
        Text("$firstname $surname")
      ],
    );
  }
}
