import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/sos_view_model.dart';

class UpdateMessageDialog extends StatefulWidget {
  const UpdateMessageDialog({super.key});

  @override
  State<UpdateMessageDialog> createState() => _UpdateMessageDialogState();
}

class _UpdateMessageDialogState extends State<UpdateMessageDialog> {
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SosViewModel>(context, listen: false);
    messageController.text = viewModel.message;

    return AlertDialog(
      title: const Text("Update SOS message"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              "Write your new SOS message. You can fill your actual location using @loc."),
          TextFormField(controller: messageController, maxLines: null),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            viewModel.message = messageController.text;
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Dismiss"),
        ),
      ],
    );
  }
}
