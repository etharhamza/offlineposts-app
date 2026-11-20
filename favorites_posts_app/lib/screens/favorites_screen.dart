import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/post_model.dart';
import '../services/favorites_service.dart';
import '../widgets/post_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<Post>('favoritesBox');
    final favoritesService = FavoritesService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ValueListenableBuilder<Box<Post>>(
        valueListenable: favoritesBox.listenable(),
        builder: (context, box, _) {
          final favorites = favoritesService.getFavorites();

          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final post = favorites[index];
              return PostCard(
                post: post,
                isFavorite: true,
                onFavoritePressed: () => favoritesService.toggleFavorite(post),
              );
            },
          );
        },
      ),
    );
  }
}
