import 'package:flutter/material.dart';

const colors = {
  "red": Colors.red,
  "pink": Colors.pink,
  "purple": Colors.purple,
  "deep purple": Colors.deepPurple,
  "indigo": Colors.indigo,
  "blue": Colors.blue,
  "light blue": Colors.lightBlue,
  "cyan": Colors.cyan,
  "teal": Colors.teal,
  "green": Colors.green,
  "light green": Colors.lightGreen,
  "lime": Colors.lime,
  "yellow": Colors.yellow,
  "amber": Colors.amber,
  "orange": Colors.orange,
  "deep orange": Colors.deepOrange,
  "brown": Colors.brown,
  "blue grey": Colors.blueGrey,
  "grey": Colors.grey,
};

MaterialColor getColorValue(String color) => colors[color] ?? Colors.grey;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var color = "red";

  void setColor(String value) => setState(() => color = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
        ColorScheme.fromSeed(seedColor: getColorValue(color)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tutoriel 3"),
          backgroundColor: getColorValue(color).shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: getColorValue(color),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "red",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: color == "green",
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.red.withOpacity(0.4),
                    onChanged: (value) => setColor(value ? "green" : "red"),
                  ),
                  const Text(
                    "green",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
