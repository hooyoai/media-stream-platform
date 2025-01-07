// File: mobile/lib/app/routes.dart
// Application routing configuration

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// TODO: Import screens

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/video/:id',
      builder: (context, state) => VideoPlayerScreen(
        videoId: state.params['id']!,
      ),
    ),
    GoRoute(
      path: '/article/:id',
      builder: (context, state) => ArticleScreen(
        articleId: state.params['id']!,
      ),
    ),
    // TODO: Add more routes
  ],
);