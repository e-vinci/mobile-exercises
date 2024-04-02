import 'package:ex6/view_models/photo_view_model.dart';
import 'package:ex6/views/add_photo_screen.dart';
import 'package:ex6/views/photo_gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PhotoGalleryScreen(),
      routes: [
        GoRoute(
          path: 'photos/add',
          builder: (context, state) => const AddPhotoScreen(),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(ChangeNotifierProvider<PhotoViewModel>(
      create: (context) => PhotoViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Exercise 6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
