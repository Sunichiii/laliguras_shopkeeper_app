import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<bool> _favorites = [];

  // Initialize favorites with the given length
  void initializeFavorites(int length) {
    _favorites = List<bool>.filled(length, false);
    notifyListeners();
  }

  // Getter for the favorites list
  List<bool> get favorites => _favorites;

  // Toggle the favorite status for a given index
  void toggleFavorite(int index) {
    if (index >= 0 && index < _favorites.length) {
      _favorites[index] = !_favorites[index];
      notifyListeners();
    }
  }
}
