import 'package:flutter/material.dart';

import '../models/ghibli_movie.dart';

class MovieWidget extends StatelessWidget {
  final GhibliMovie movie;

  const MovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(movie.image, width: 200),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.releaseDate,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Divider(),
                  Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text(
                    "${movie.rtScore} %",
                    style: TextStyle(
                      color: int.parse(movie.rtScore) > 80
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const Divider(),
                  Text("${movie.runningTime} minutes"),
                  const Divider(),
                  Text("Directed by ${movie.director}"),
                  const Divider(),
                  Text(
                    movie.description,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
