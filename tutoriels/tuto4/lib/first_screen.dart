import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final int nbClicks;

  const FirstScreen({super.key, this.nbClicks = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First screen"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Hello from first screen."),
            const SizedBox(height: 16),
            Text("There were $nbClicks clicks in the second page."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go("/secondscreen"),
              child: const Text("Go to second screen"),
            ),
            Expanded(child: UserListView()),
          ],
        ),
      ),
    );
  }
}

class UserListView extends StatelessWidget {
  final List<String> usernames = ['mcCain123', 'greg123', 'sarah123'];

  UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usernames.length,
      itemBuilder: (context, index) {
        final username = usernames[index];
        return ListTile(
          title: Text(username),
          onTap: () => context.go('/users/$username'),
        );
      },
    );
  }
}
