// File: mobile/lib/app/providers.dart
// Global state management setup using Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Auth State Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Content State Provider
final contentProvider = StateNotifierProvider<ContentNotifier, ContentState>((ref) {
  return ContentNotifier();
});

// TODO: Implement state notifiers and state classes
