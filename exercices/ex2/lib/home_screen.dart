import 'package:flutter/material.dart';

import 'property.dart';
import 'property_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = [...propertiesToSell, ...propertiesToRent];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Properties"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: properties.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) =>
              PropertyWidget(property: properties[index]),
        ),
      ),
    );
  }
}
