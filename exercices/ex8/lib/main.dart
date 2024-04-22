import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:ex8/view_models/video_view_model.dart';
import 'package:ex8/views/display_picture_screen.dart';
import 'package:ex8/views/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TakePictureScreen() /*{
        return Consumer<VideoViewModel>(builder: (context, viewModel, child) {
          final selectedCamera = viewModel.selectedCamera;
          log("Selected camera : $selectedCamera", name: "main");
          if (selectedCamera == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return TakePictureScreen() ;//camera: selectedCamera);
        });
      }*/,
      routes: [
        GoRoute(
          path: 'display',
          builder: (context, state) {
            // get the image path from the extra parameter
            // final String imagePath = state.extra as String;
            return DisplayPictureScreen();
          },
        ),
      ],
    ),
  ],
);

void main() async {
  runApp(ChangeNotifierProvider<VideoViewModel>(
      create: (context) => VideoViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
