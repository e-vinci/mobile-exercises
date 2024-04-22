// A screen that allows users to take a picture using a given camera.

import 'dart:developer';

import 'package:camera/camera.dart';
import '/view_models/video_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  @override
  void dispose() {
    Provider.of<VideoViewModel>(context, listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // You must wait until the controller is initialized before displaying the
// camera preview.

        Scaffold(
      appBar: AppBar(
        title: Text('Take a picture : )'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Consumer<VideoViewModel>(builder: (context, viewModel, child) {
        if (viewModel.cameraController == null || viewModel.isInitializing) {
          return const Center(child: CircularProgressIndicator());
        }

        return CameraPreview(viewModel.cameraController!);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Ensure that the camera is initialized.
            if (Provider.of<VideoViewModel>(context, listen: false)
                        .cameraController ==
                    null ||
                Provider.of<VideoViewModel>(context, listen: false)
                    .isInitializing) {
              return;
            }
            // Take a picture and save the image in the viewmodel.
            await Provider.of<VideoViewModel>(context, listen: false)
                .takePicture();

            // If the picture was taken, display it on a new screen.
            context.go('/display'); // , extra: image.path);
          } catch (e) {
            log(e.toString(), name: 'TakePictureScreen');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
