import 'package:flutter/material.dart';

import 'main.dart';
import 'my_form.dart';
import 'my_square.dart';
import 'my_switch.dart';

class HomeScreen extends StatelessWidget {
  final String color;
  final void Function(String) setColor;

  const HomeScreen({super.key, required this.color, required this.setColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutoriel 3"),
        backgroundColor: getColorValue(color).shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            MySquare(color: color),
            MySwitch(color: color, setColor: setColor),
            MyForm(setColor),
          ],
        ),
      ),
    );
  }
}
