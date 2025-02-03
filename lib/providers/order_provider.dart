import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderProvider extends ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void initializeOrders(List<Order> initialOrders) {
    _orders = initialOrders;
    notifyListeners();
  }

  void updateOrderStep(int index, int step) {
    _orders[index] = _orders[index].copyWith(currentStep: step);
    notifyListeners();
  }
}
