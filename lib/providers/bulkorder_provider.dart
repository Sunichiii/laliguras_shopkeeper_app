import 'package:flutter/material.dart';

class BulkOrderProvider extends ChangeNotifier {
  final Map<String, int> _quantities = {};

  // Initialize quantities for vegetables
  void initializeQuantities(List<String> vegetableNames) {
    for (var name in vegetableNames) {
      _quantities[name] = 35;
    }
  }

  // Get quantity for a vegetable
  int getQuantity(String name) {
    return _quantities[name] ?? 0;
  }

  // Increase quantity
  void incrementQuantity(String name) {
    if (_quantities.containsKey(name)) {
      _quantities[name] = _quantities[name]! + 1;
      notifyListeners();
    }
  }

  // Decrease quantity
  void decrementQuantity(String name) {
    if (_quantities.containsKey(name) && _quantities[name]! > 0) {
      _quantities[name] = _quantities[name]! - 1;
      notifyListeners();
    }
  }
}
