import 'package:flutter/material.dart';
import 'package:tuto1/product_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Column(
            children: [
              ProductWidget(),
              ProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
