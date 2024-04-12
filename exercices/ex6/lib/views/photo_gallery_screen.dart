import 'package:ex6/models/photo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../view_models/photo_view_model.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Consumer<PhotoViewModel>(
          builder: (context, photoViewModel, child) {
            return FutureBuilder<List<Photo>>(
              future: photoViewModel.photos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.beat(
                        color: Colors.red, size: 50),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                final List<Photo> photos = snapshot.data!;
                return ListView.builder(
                  itemCount: photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                          Image.network(width: 100, photos[index].thumbnailUrl),
                      title: Text("${photos[index].id} ${photos[index].title}"),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/photos/add'),
        tooltip: 'Add photo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
