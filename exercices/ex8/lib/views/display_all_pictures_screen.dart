import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view_models/video_view_model.dart';

class DisplayAllPicturesScreen extends StatelessWidget {
  const DisplayAllPicturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gallery of pictures'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body:
            kIsWeb // We prefer not to deal with the view model here because the file picker is a UI widget (not directly related to the data)
                ? FutureBuilder(
                    future: FilePicker.platform.pickFiles(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.memory(
                            snapshot.data!.files.single.bytes ?? Uint8List(0));
                      }
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                : const MyPhotoGallery());
  }
}

class MyPhotoGallery extends StatefulWidget {
  const MyPhotoGallery({super.key});

  @override
  State<MyPhotoGallery> createState() => _MyPhotoGalleryState();
}

class _MyPhotoGalleryState extends State<MyPhotoGallery> {
  @override
  void initState() {
    super.initState();
    Provider.of<VideoViewModel>(context, listen: false).loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.photoGallery.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: viewModel.photoGallery.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Image.file(viewModel.photoGallery[index]),
                onTap: () async {
                  final XFile image = XFile(viewModel.photoGallery[index].path);
                  log("Image clicked : ${image.path}",
                      name: "DisplayAllPicturesScreen");
                  viewModel.image = image;
                  context.go('/display-picture');
                });
          },
        );
      },
    );
  }
}
