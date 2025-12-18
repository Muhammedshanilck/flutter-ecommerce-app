import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  bool isFavorite(String title) {
    return _favorites.any((item) => item['title'] == title);
  }

  void toggleFavorite({
    required String image,
    required String category,
    required String title,
    required String price,
    required String oldPrice,
    required String description,
  }) {
    final index =
        _favorites.indexWhere((item) => item['title'] == title);

    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add({
        'image': image,
        'category': category,
        'title': title,
        'price': price,
        'oldPrice': oldPrice,
        'description': description,
      });
    }
    notifyListeners();
  }
}
