import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class VideoViewModel extends ChangeNotifier {
  CameraDescription? _selectedCamera;

  CameraController? _controller;
  bool _isInitializing = false;
  String? _imagePath;

  CameraDescription? get selectedCamera => _selectedCamera;
  String get imagePath => _imagePath ?? "";

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

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  Future<void> takePicture() async {
    try {
      final imageFile = await _controller?.takePicture();
      _imagePath = imageFile?.path;
      log("Image path : $_imagePath", name: "VideoViewModel");
    } catch (e) {
      log("Exception : $e", name: "VideoViewModel");
    }
  }
}
