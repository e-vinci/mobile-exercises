import 'dart:convert';
import 'package:http/http.dart' as http;

class Film {
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/films-api";

  final int id;
  final String title;
  final String director;
  final int duration;
  final String link;

  const Film(this.id, this.title, this.director, this.duration, this.link);

  Film.fromJson(Map<String, dynamic> jsonObj)
      : this(
    jsonObj["id"],
    jsonObj["title"],
    jsonObj["director"],
    jsonObj["duration"],
    jsonObj["link"],
  );

  @override
  String toString() =>
      'Film: $title, directed by $director, $duration min, $link';

  static Future<Film> fetchFilm(int id) async {
    var response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movie");
    }

    return Film.fromJson(jsonDecode(response.body));
  }
}
