import 'package:flutter/cupertino.dart';

import '../models/photo.dart';
import '../models/photo_repository.dart';

class PhotoViewModel extends ChangeNotifier {
  final PhotoRepository _repository = PhotoRepository();
  String _errorMessage = '';

  Future<List<Photo>> get photos => fetchPhotos();

  bool get hasError => _errorMessage.isNotEmpty;

  String get errorMessage => _errorMessage;

  Future<List<Photo>> fetchPhotos() async {
    try {
      final List<Photo> fetchedPhotos = await Future.delayed(
          const Duration(seconds: 4), () => _repository.fetchPhotos());
      fetchedPhotos.sort(
        (a, b) => b.id.compareTo(a.id),
      );
      return fetchedPhotos;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    }
  }
}
