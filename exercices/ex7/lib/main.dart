import 'package:ex7/views/recipients_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'view_models/sos_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<SosViewModel>(
    create: (context) => SosViewModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: "recipients",
                builder: (context, state) => const ManageRecipientsScreen(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
