import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class VideoViewModel extends ChangeNotifier {
  CameraDescription? _selectedCamera;

  CameraController? _controller;
  bool _isInitializing = false;
  XFile? _image;
  final List<File> photoGallery = [];

  CameraDescription? get selectedCamera => _selectedCamera;

  XFile? get image => _image;

  set image(XFile? value) => _image = value;

  bool get isInitializing => _isInitializing;

  CameraController? get cameraController => _controller;

  VideoViewModel() {
    _initVideoController();
  }

  Future<void> _initVideoController() async {
    try {
      _isInitializing = true;
      notifyListeners(); // This will allow for a loading spinner to be displayed

      // Obtain a list of the available cameras on the device.
      final cameras = await availableCameras();

      // Get a specific camera from the list of available cameras.
      log("Number of cameras : ${cameras.length}", name: "VideoViewModel");
      log("Cameras : $cameras", name: "VideoViewModel");
      _selectedCamera = cameras.first;

      _controller = CameraController(
        // Get a specific camera from the list of available cameras.
        cameras.first,
        ResolutionPreset.medium,
      );

      await _controller?.initialize();

      _isInitializing = false;

      notifyListeners();
    } catch (e) {
      log("Exception : $e", name: "VideoViewModel");
      throw e;
    }
  }

  Future<void> resumePreview() async {
    await _controller?.resumePreview();
    notifyListeners();
  }

  Future<void> pausePreview() async {
    await _controller?.pausePreview();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  Future<void> takePicture() async {
    try {
      _image = await _controller?.takePicture();
    } catch (e) {
      log("Exception : $e", name: "VideoViewModel");
    }
  }

  Future<void> loadPhotos() async {
    final Directory? appDir = await getExternalStorageDirectory();

    final appFiles = appDir!.listSync();
    log("ALL FILES : $appFiles", name: "VideoViewModel");

    photoGallery.clear();

    for (final FileSystemEntity file in appFiles) {
      if (file is File && file.path.toLowerCase().contains('.jpg')) {
        photoGallery.add(file);
        log("photo: ${file.path}", name: "VideoViewModel");
      }
    }
    notifyListeners();
  }
}
