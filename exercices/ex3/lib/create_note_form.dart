import 'package:flutter/material.dart';

import 'note.dart';

class CreateNoteForm extends StatefulWidget {
  final void Function(Note) addNote;

  const CreateNoteForm({super.key, required this.addNote});

  @override
  State<CreateNoteForm> createState() => _CreateNoteFormState();
}

class _CreateNoteFormState extends State<CreateNoteForm> {
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
    return Form(
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
                widget.addNote(Note(
                  titleController.text,
                  contentController.text,
                ));
                titleController.text = "";
                contentController.text = "";
              }
            },
          )
        ],
      ),
    );
  }
}
