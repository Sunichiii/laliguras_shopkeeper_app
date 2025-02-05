// cart_provider.dart
import 'package:flutter/material.dart';
import '../models/vegetable_model.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Vegetable vegetable, int quantity) {
    final index = _cartItems.indexWhere(
            (item) => item['vegetable'].name == vegetable.name);

    if (index != -1) {
      _cartItems[index]['quantity'] += quantity;
    } else {
      _cartItems.add({'vegetable': vegetable, 'quantity': quantity});
    }
    notifyListeners();
  }

  void updateQuantity(Vegetable vegetable, int quantity) {
    final index = _cartItems.indexWhere(
            (item) => item['vegetable'].name == vegetable.name);

    if (index != -1) {
      _cartItems[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void removeFromCart(Vegetable vegetable) {
    _cartItems.removeWhere((item) => item['vegetable'].name == vegetable.name);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) {
      return sum + (item['vegetable'].price * item['quantity']);
    });
  }
}
