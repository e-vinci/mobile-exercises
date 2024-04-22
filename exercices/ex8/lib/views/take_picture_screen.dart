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
    return Consumer<VideoViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Take a picture : )'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          actions: [
            IconButton(
              icon: const Icon(Icons.photo_album),
              onPressed: () {
                context.go('/display-gallery');
              },
            ),
          ],
        ),
        body: viewModel.cameraController == null || viewModel.isInitializing
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  CameraPreview(viewModel.cameraController!),
                  // Deal with a paused preview.
                  IconButton(
                      icon: viewModel.cameraController!.value.isPreviewPaused
                          ? const Icon(Icons.play_arrow)
                          : const Icon(Icons.pause_presentation),
                      color: viewModel.cameraController!.value.isPreviewPaused
                          ? Colors.green
                          : Colors.red,
                      onPressed: () async {
                        if (!viewModel.cameraController!.value.isInitialized) {
                          var showSnackBar = ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Error: select a camera first.'),
                          ));

                          return;
                        }

                        if (viewModel.cameraController!.value.isPreviewPaused) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('The preview is resumed.'),
                          ));
                          await viewModel.resumePreview();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('The preview is paused.'),
                          ));
                          await viewModel.pausePreview();
                        }
                      }),
                ],
              ),
        floatingActionButton: viewModel.cameraController == null ||
                viewModel.cameraController!.value.isPreviewPaused
            ? null
            : FloatingActionButton(
                onPressed: () async {
                  try {
                    // Take a picture and save the image in the viewmodel.
                    await Provider.of<VideoViewModel>(context, listen: false)
                        .takePicture();

                    // If the picture was taken, display it on a new screen.
                    context.go('/display-picture'); // , extra: image.path);
                  } catch (e) {
                    log(e.toString(), name: 'TakePictureScreen');
                  }
                },
                child: const Icon(Icons.camera_alt),
              ),
      );
    });
  }
}
