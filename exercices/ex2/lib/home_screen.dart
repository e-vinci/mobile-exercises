import 'package:flutter/material.dart';

import 'property.dart';
import 'property_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Properties"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: PropertyWidget(property: propertiesToSell.first),
    );
  }
}
