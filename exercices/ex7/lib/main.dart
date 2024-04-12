import 'package:ex7/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_models/sos_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider<SosViewModel>(
    create: (context) => SosViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
