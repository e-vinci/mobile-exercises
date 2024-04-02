import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'photo.dart';

class PhotoRepository {
  final String _baseUrl = 'https://unreal-api.azurewebsites.net/';
  final http.Client _http = http.Client();

  Future<List<Photo>> fetchPhotos() async {
    try {
      final response = await _http.get(Uri.parse('$_baseUrl/photos'));
      if (response.statusCode == 200) {
        return compute(
            (responseBodyReceived) => jsonDecode(responseBodyReceived)
                .map<Photo>((jsonObj) => Photo.fromJson(jsonObj))
                .toList(),
            response.body);
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> addPhoto(Photo photo) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/photos'),
        body: jsonEncode({
          'title': photo.title,
          'url': photo.url,
          'thumbnailUrl': photo.thumbnailUrl,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final dynamic photoJson =
            await Future.value(json.decode(response.body));
        final photo = Photo.fromJson(photoJson);
        log("add : id :${photo.id} thumbnailUrl : ${photo.thumbnailUrl}",
            name: "PhotoRepository");
        return true;
      } else {
        log("Status code ${response.statusCode} response.body : ${response.body}",
            name: "PhotoRepository");
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
