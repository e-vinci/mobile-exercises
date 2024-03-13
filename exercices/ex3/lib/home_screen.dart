import 'package:flutter/material.dart';

import 'note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final notes = <Note>[
    const Note("ABC", "DEF"),
    const Note("Test", "Bonjour tout le monde!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercice 3"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: notes.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => setState(() => notes.removeAt(index)),
            ),
          ),
        ),
      ),
    );
  }
}
