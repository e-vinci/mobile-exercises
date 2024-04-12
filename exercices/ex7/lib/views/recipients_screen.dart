import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/sos_view_model.dart';

class ManageRecipientsScreen extends StatefulWidget {
  const ManageRecipientsScreen({super.key});

  @override
  State<ManageRecipientsScreen> createState() => _ManageRecipientsScreenState();
}

class _ManageRecipientsScreenState extends State<ManageRecipientsScreen> {
  final recipientController = TextEditingController();

  @override
  void dispose() {
    recipientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage SOS recipients"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<SosViewModel>(
          builder: (context, viewModel, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.recipients.length,
                  itemBuilder: (context, index) {
                    final recipient = viewModel.recipients[index];
                    return ListTile(
                      title: Text(recipient),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => viewModel.removeRecipient(recipient),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: recipientController,
                      decoration: const InputDecoration(
                          labelText: "New recipient number"),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      viewModel.addRecipient(recipientController.text);
                      recipientController.text = "";
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
