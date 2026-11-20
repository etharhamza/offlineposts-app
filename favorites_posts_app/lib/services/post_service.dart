import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    final box = Hive.box<Post>('postsBox');

    try {
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final onlinePosts = data
            .map((item) => Post.fromJson(item as Map<String, dynamic>))
            .toList();

        await box.clear();
        await box.addAll(onlinePosts);
        return onlinePosts;
      }
    } catch (_) {
      // Fall through to the locally cached posts for offline use.
    }

    if (box.isNotEmpty) {
      return box.values.toList();
    }

    throw Exception('No Internet and No Cached Data');
  }
}
