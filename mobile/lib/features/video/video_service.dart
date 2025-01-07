import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoService {
  final String baseUrl; // Your API base URL

  VideoService({required this.baseUrl});

  Future<Map<String, dynamic>> getVideoDetails(String videoId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/content/$videoId'),
        headers: {
          'Content-Type': 'application/json',
          // TODO: Add authentication headers
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load video details');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }

  Future<String> getStreamUrl(String videoId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stream/$videoId/url'),
        headers: {
          'Content-Type': 'application/json',
          // TODO: Add authentication headers
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['url'];
      } else {
        throw Exception('Failed to get stream URL');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getRecommendedVideos(String videoId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/content/$videoId/recommendations'),
        headers: {
          'Content-Type': 'application/json',
          // TODO: Add authentication headers
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load recommended videos');
      }
    } catch (e) {
      throw Exception('Error connecting to server: $e');
    }
  }
}

// Provider for video service
final videoServiceProvider = Provider((ref) {
  // TODO: Get base URL from configuration
  return VideoService(baseUrl: 'https://api.your-service.com');
});

// Provider for video details
final videoDetailsProvider = FutureProvider.family<Map<String, dynamic>, String>(
  (ref, videoId) async {
    final videoService = ref.watch(videoServiceProvider);
    return videoService.getVideoDetails(videoId);
  },
);

// Provider for video stream URL
final videoStreamUrlProvider = FutureProvider.family<String, String>(
  (ref, videoId) async {
    final videoService = ref.watch(videoServiceProvider);
    return videoService.getStreamUrl(videoId);
  },
);