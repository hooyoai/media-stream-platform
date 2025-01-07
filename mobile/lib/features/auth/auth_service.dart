// File: mobile/lib/features/auth/auth_service.dart
// Handles authentication using Firebase

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream of user changes
  Stream<User?> get userChanges => _auth.authStateChanges();

  // Current user
  User? get currentUser => _auth.currentUser;

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailPassword(String email, String password) async {
    try {
      // TODO: Implement email/password sign in
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }

  // Sign up with email and password
  Future<UserCredential?> signUpWithEmailPassword(String email, String password) async {
    try {
      // TODO: Implement email/password sign up
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      // TODO: Implement sign out
      throw UnimplementedError();
    } catch (e) {
      rethrow;
    }
  }
}
