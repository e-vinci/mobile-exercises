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

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

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
            const SizedBox(height: 16.0),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: "Note title"),
                    validator: (value) => (value == null || value == "")
                        ? "Note title can't be empty"
                        : null,
                  ),
                  TextFormField(
                    maxLines: null,
                    controller: contentController,
                    decoration: const InputDecoration(labelText: "Note content"),
                    validator: (value) => (value == null || value == "")
                        ? "Note content can't be empty"
                        : null,
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    child: const Text("Create note"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        setState(() => notes.add(Note(
                          titleController.text,
                          contentController.text,
                        )));
                        titleController.text = "";
                        contentController.text = "";
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
