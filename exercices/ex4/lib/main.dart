import 'views/article_screen.dart';
import 'views/form_screen.dart';
import 'views/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/article.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListScreen(),
      routes: [
        GoRoute(
          path: 'create-article',
          builder: (context, state) => const FormScreen(),
        ),
        GoRoute(
          path: 'articles/:id',
          builder: (context, state) {
            // get the article from the extra argument
            final article = state.extra as Article;
            return ArticleScreen(article: article!);
          },
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
      title: 'Articles App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
