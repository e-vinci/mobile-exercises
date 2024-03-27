import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class GhibliMovie {
  static const uri = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";

  final String id;
  final String title;
  final String image;
  final String description;
  final String releaseDate;
  final String director;
  final String runningTime;
  final String rtScore;

  GhibliMovie({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.director,
    required this.runningTime,
    required this.rtScore,
  });

  GhibliMovie.fromJSON(Map<String, dynamic> json)
      : this(
          id: json["id"],
          title: json["title"],
          image: json["image"],
          description: json["description"],
          releaseDate: json["release_date"],
          director: json["director"],
          runningTime: json["running_time"],
          rtScore: json["rt_score"],
        );

  @override
  String toString() {
    return 'GhibliMovie{id: $id, title: $title, image: $image, '
        'description: $description, releaseDate: $releaseDate, '
        'director: $director, runningTime: $runningTime, rtScore: $rtScore}';
  }

  static Future<List<GhibliMovie>> fetch() async {
    var response = await get(Uri.parse(uri));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute(
      (input) => jsonDecode(response.body)
          .map<GhibliMovie>((jsonObj) => GhibliMovie.fromJSON(jsonObj))
          .toList(),
      response.body,
    );
  }
}
