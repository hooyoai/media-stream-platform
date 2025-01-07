// File: mobile/lib/main.dart
// Main entry point for the Flutter application

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MediaStreamApp());
}

class MediaStreamApp extends StatelessWidget {
  const MediaStreamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Stream',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthWrapper(), // TODO: Implement AuthWrapper
    );
  }
}
