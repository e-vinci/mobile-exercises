import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuto4/second_screen.dart';
import 'package:tuto4/user_screen.dart';

import 'first_screen.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        final int nbClicks = (state.extra ?? 0) as int;
        return FirstScreen(nbClicks: nbClicks);
      },
      routes: [
        GoRoute(
          path: 'secondscreen',
          builder: (context, state) => const SecondScreen(),
        ),
        GoRoute(
          path: 'users/:username',
          builder: (context, state) =>
              UserScreen(username: state.pathParameters['username'] ?? ''),
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const MyApp());
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
