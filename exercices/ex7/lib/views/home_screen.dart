import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'update_message_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOS app"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const UpdateMessageDialog(),
                ),
                child: const Text("Change SOS message"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go("/recipients"),
                child: const Text("Manage SOS recipients"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
