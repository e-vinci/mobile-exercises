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
}
