import 'package:flutter/material.dart';

import 'create_note_form.dart';
import 'note.dart';
import 'note_list.dart';

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
        child: Column(
          children: [
            Expanded(
              child: NoteList(
                notes: notes,
                deleteNote: (note) => setState(() => notes.remove(note)),
              ),
            ),
            const SizedBox(height: 16.0),
            CreateNoteForm(addNote: (note) => setState(() => notes.add(note))),
          ],
        ),
      ),
    );
  }
}
