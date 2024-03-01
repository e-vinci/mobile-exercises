import 'package:flutter/material.dart';

import 'contact.dart';
import 'contact_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactRows =
    defaultContacts.map((contact) => ContactRow(contact: contact)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Contact list"),
      ),
      body: ListView(children: contactRows),
    );
  }

}
