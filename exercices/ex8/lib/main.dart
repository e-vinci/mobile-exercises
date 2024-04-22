
import 'view_models/video_view_model.dart';
import 'views/display_picture_screen.dart';
import 'views/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TakePictureScreen(),
      routes: [
        GoRoute(
          path: 'display',
          builder: (context, state) {
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
