import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String platform;

    if (kIsWeb) {
      platform = "Web";
    } else if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "iOS";
    } else if (Platform.isWindows) {
      platform = "Windows";
    } else if (Platform.isMacOS) {
      platform = "macOS";
    } else if (Platform.isLinux) {
      platform = "Linux";
    } else {
      platform = "Unknown";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutoriel 7"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text("Hello from $platform!"),
            ],
          ),
        ),
      ),
    );
  }
}
