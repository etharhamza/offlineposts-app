# Offline Posts App with Favorites

This Flutter app is based on the Section 5 Hive assignment. It loads posts from the JSONPlaceholder API, caches them locally in Hive, and continues to show cached posts without an internet connection. Users can save posts as favorites in a separate Hive box.

## Features

- Loads posts from `https://jsonplaceholder.typicode.com/posts`.
- Caches posts in `postsBox` for offline use.
- Stores favorites separately in `favoritesBox`.
- Uses the post ID as the favorite key.
- Uses a copied `Post` object when saving to the favorites box because a Hive object cannot belong to two boxes.
- Filled and outlined star icons show favorite state.
- Favorites update immediately when a star is tapped.
- Favorites screen uses the same card design as the posts screen.
- Shows `No favorites yet` when the favorites box is empty.
- Favorites survive refreshes, app restarts, and airplane mode.

## Run the project

This source package was prepared without the Flutter SDK in the build environment. On a computer with Flutter installed:

```bash
flutter create .
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

If `flutter create .` asks about existing files, keep the existing `lib/`, `pubspec.yaml`, and `README.md` files. It will generate the platform folders (`android/`, `ios/`, etc.).

## Test offline persistence

1. Run the app with internet access.
2. Tap the star on several posts.
3. Open the heart button in the AppBar and confirm the posts appear.
4. Close the app completely.
5. Turn on airplane mode.
6. Reopen the app and open Favorites.
7. Confirm the same favorites are still present.

## Main files

```text
lib/
├── main.dart
├── models/
│   ├── post_model.dart
│   └── post_model.g.dart
├── services/
│   ├── post_service.dart
│   └── favorites_service.dart
├── screens/
│   ├── posts_screen.dart
│   └── favorites_screen.dart
└── widgets/
    └── post_card.dart
```
