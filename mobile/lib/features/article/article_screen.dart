import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleScreen extends ConsumerWidget {
  final String articleId;

  const ArticleScreen({
    Key? key,
    required this.articleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Implement article provider and fetch article data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: const Center(
        child: Text('Article content will be displayed here'),
      ),
    );
  }
}