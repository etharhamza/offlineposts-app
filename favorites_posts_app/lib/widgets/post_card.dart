import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const PostCard({
    super.key,
    required this.post,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
        leading: CircleAvatar(
          child: Text('${post.id}'),
        ),
        title: Text(
          post.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            post.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: isFavorite ? Colors.amber.shade700 : null,
            size: 30,
          ),
          tooltip: isFavorite
              ? 'Remove from favorites'
              : 'Add to favorites',
          onPressed: onFavoritePressed,
        ),
      ),
    );
  }
}
