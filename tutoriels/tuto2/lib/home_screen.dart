import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contact list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 512,
            child: ListView.builder(
              itemCount: defaultContacts.length,
              itemBuilder: (context, index) =>
                  ContactRow(contact: defaultContacts[index]),
            ),
          ),
        ),
      ),
    );
  }
}
