import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var message = "Loading, please wait…";

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      setState(() => message = "Loading, any second now…");
      try {
        final response = await get(Uri.parse(
            "https://sebstreb.github.io/flutter-fiche-5/ghibli-films"));
        if (response.statusCode != 200) {
          throw Exception("Error ${response.statusCode}");
        }
        setState(() => message = response.body);
      } catch (error) {
        setState(() => message = error.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Studio Ghibli Movies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: SingleChildScrollView(child: Text(message))),
      ),
    );
  }
}
