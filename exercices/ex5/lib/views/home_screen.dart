import 'package:flutter/material.dart';

import '../models/ghibli_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var message = "Loading, please wait…";
  final movies = <GhibliMovie>[];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      try {
        setState(() => message = "Loading, any second now…");
        final response = await GhibliMovie.fetch();
        setState(() {
          if (response.isEmpty) message = "No movies found…";
          movies.addAll(response);
        });
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
        title: const Text("Studio Ghibli Movies"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: movies.isEmpty
              ? Text(message)
              : ListView.separated(
                  itemCount: movies.length,
                  itemBuilder: (context, index) =>
                      Text(movies[index].toString()),
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                ),
        ),
      ),
    );
  }
}
