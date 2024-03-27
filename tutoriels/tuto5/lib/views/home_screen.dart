import 'package:flutter/material.dart';

import '../models/film.dart';
import 'film_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var message = " Loading, please wait…";
  Film? film;

  Future<void> _initFilm() async {
    try {
      var response = await Film.fetchFilm(2);
      setState(() => film = response);
    } catch (error) {
      setState(() => message = error.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _initFilm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Tutoriel 5"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: film == null
            ? Column(children: [Center(child: Text(message))])
            : FilmRow(film: film!),
      ),
    );
  }
}

