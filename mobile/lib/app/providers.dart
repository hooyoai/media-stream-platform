import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/auth_state.dart';

// Content state definition
enum ContentLoadingStatus {
  initial,
  loading,
  loaded,
  error,
}

class ContentState {
  final ContentLoadingStatus status;
  final List<Map<String, dynamic>> items;
  final String? errorMessage;

  const ContentState({
    this.status = ContentLoadingStatus.initial,
    this.items = const [],
    this.errorMessage,
  });

  ContentState copyWith({
    ContentLoadingStatus? status,
    List<Map<String, dynamic>>? items,
    String? errorMessage,
  }) {
    return ContentState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class ContentNotifier extends StateNotifier<ContentState> {
  ContentNotifier() : super(const ContentState());

  Future<void> loadContent() async {
    state = state.copyWith(status: ContentLoadingStatus.loading);

    try {
      // TODO: Implement content loading from API
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulated content
      final items = List.generate(
        10,
        (index) => {
          'id': 'video_$index',
          'title': 'Video $index',
          'thumbnail': 'https://example.com/thumbnail_$index.jpg',
          'type': 'video',
        },
      );
      
      state = state.copyWith(
        status: ContentLoadingStatus.loaded,
        items: items,
      );
    } catch (e) {
      state = state.copyWith(
        status: ContentLoadingStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  void resetError() {
    state = state.copyWith(
      status: ContentLoadingStatus.initial,
      errorMessage: null,
    );
  }
}

// Global provider for content state
final contentProvider = StateNotifierProvider<ContentNotifier, ContentState>((ref) {
  return ContentNotifier();
});