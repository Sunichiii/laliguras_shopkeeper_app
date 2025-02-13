import 'package:flutter/material.dart';
import '../models/vegetable_model.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  /// Add item to cart or update its quantity
  void addToCart(Vegetable vegetable, int quantity) {
    final index = _cartItems.indexWhere(
            (item) => item['vegetable'].id == vegetable.id); // Use ID instead of name

    if (index != -1) {
      _cartItems[index]['quantity'] += quantity;
    } else {
      _cartItems.add({'vegetable': vegetable, 'quantity': quantity});
    }
    notifyListeners();
  }

  /// Update item quantity
  void updateQuantity(Vegetable vegetable, int quantity) {
    final index = _cartItems.indexWhere(
            (item) => item['vegetable'].id == vegetable.id); // Use ID instead of name

    if (index != -1) {
      if (quantity > 0) {
        _cartItems[index]['quantity'] = quantity;
      } else {
        removeFromCart(vegetable);
      }
      notifyListeners();
    }
  }

  /// Remove item from cart
  void removeFromCart(Vegetable vegetable) {
    _cartItems.removeWhere((item) => item['vegetable'].id == vegetable.id);
    notifyListeners();
  }

  /// Get quantity of a specific product
  int getQuantity(Vegetable vegetable) {
    final index = _cartItems.indexWhere(
            (item) => item['vegetable'].id == vegetable.id);
    if (index != -1) {
      return _cartItems[index]['quantity'];
    }
    return 0; // Return 0 if not in cart
  }

  /// Calculate total price
  double get totalPrice {
    return _cartItems.fold(0.0, (sum, item) {
      return sum + (item['vegetable'].price * item['quantity']);
    });
  }
}
