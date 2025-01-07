import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/auth_wrapper.dart';
import 'features/auth/auth_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: MediaStreamApp(),
    ),
  );
}

class MediaStreamApp extends ConsumerWidget {
  const MediaStreamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final authState = ref.read(authProvider);
        final isAuthenticated = authState.status == AuthStatus.authenticated;

        // If trying to access authenticated routes while not logged in
        if (!isAuthenticated && !state.location.startsWith('/auth')) {
          return '/auth/login';
        }

        // If trying to access auth routes while logged in
        if (isAuthenticated && state.location.startsWith('/auth')) {
          return '/';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const AuthWrapper(),
          routes: [
            GoRoute(
              path: 'video/:id',
              builder: (context, state) => VideoPlayerScreen(
                videoId: state.params['id']!,
              ),
            ),
            GoRoute(
              path: 'article/:id',
              builder: (context, state) => ArticleScreen(
                articleId: state.params['id']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/auth/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Media Stream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}