import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/screens/home_screen.dart';
import '../features/video/video_player_screen.dart';
import '../features/article/article_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'video/:id',
          builder: (context, state) => VideoPlayerScreen(
            videoId: state.pathParameters['id']!,
          ),
        ),
        GoRoute(
          path: 'article/:id',
          builder: (context, state) => ArticleScreen(
            articleId: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
  ],
);