// File: mobile/lib/features/shared/widgets/video_thumbnail.dart
// Reusable video thumbnail widget

import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final VoidCallback onTap;

  const VideoThumbnail({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}