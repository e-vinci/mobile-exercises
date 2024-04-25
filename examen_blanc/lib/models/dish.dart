import 'dart:convert';

import 'package:http/http.dart';

class Dish {
  static const apiUrl = "https://sebstreb.github.io/binv2110-examen-blanc-api/dishes";

  final int id;
  final String name;
  final double price;
  final String category;
  final String imagePath;

  const Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
  });

  Dish.fromJson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          name: json["name"],
          price: json["price"],
          category: json["category"],
          imagePath: json["imagePath"],
        );

  static Future<List<Dish>> fetchAll() async {
    final response = await get(Uri.parse(apiUrl));
    if (response.statusCode != 200) throw Exception("Could not fetch dishes");
    return jsonDecode(response.body)
        .map<Dish>((json) => Dish.fromJson(json))
        .toList();
  }
}
