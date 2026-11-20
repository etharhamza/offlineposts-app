import 'package:hive/hive.dart';

import '../models/post_model.dart';

class FavoritesService {
  Box<Post> get _box => Hive.box<Post>('favoritesBox');

  Future<void> toggleFavorite(Post post) async {
    if (_box.containsKey(post.id)) {
      await _box.delete(post.id);
      return;
    }

    // A HiveObject can only belong to one box. Save a separate copy.
    final copy = Post(
      id: post.id,
      title: post.title,
      body: post.body,
      userId: post.userId,
    );
    await _box.put(post.id, copy);
  }

  bool isFavorite(int id) => _box.containsKey(id);

  List<Post> getFavorites() => _box.values.toList();
}
