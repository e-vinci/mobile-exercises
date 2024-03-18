import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tuto4/view_models/click_view_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var nbClicks = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          context.go("/", extra: nbClicks);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Second screen"),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Center(
          child: Consumer<ClickViewModel>(builder: (context, viewModel, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Hello from second screen."),
                const SizedBox(height: 16),
                Text("There were ${viewModel.clicks} clicks."),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.increment(),
                  child: const Text("click me"),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
