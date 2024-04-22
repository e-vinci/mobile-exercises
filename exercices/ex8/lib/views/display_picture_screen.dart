// A widget that displays the picture taken by the user.
import 'dart:developer';
import 'dart:io';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/video_view_model.dart';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String imagePath =
        Provider.of<VideoViewModel>(context, listen: false).imagePath;
    final image = Provider.of<VideoViewModel>(context, listen: false).image;

    log("Image path : $imagePath", name: "main");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: kIsWeb ? Image.network(imagePath) : Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String fileName = DateTime.now().toString();
          String filePath = '$fileName.jpg';
          final imageToBeSaved = await image?.readAsBytes();

          await FileSaver.instance.saveFile(
            name: filePath,
            bytes: imageToBeSaved!,
          );

          log("File saved at $filePath", name: "DisplayPictureScreen");
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
