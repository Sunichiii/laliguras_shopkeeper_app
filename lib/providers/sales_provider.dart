import 'package:flutter/material.dart';
import '../../models/vegetable_model.dart';

class SalesProvider with ChangeNotifier {
  List<Vegetable> _saleItems = [];
  bool _isLoading = true;
  String? _errorMessage;

  List<Vegetable> get saleItems => _saleItems;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchSalesItems() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulated delay for fetching data
      await Future.delayed(const Duration(seconds: 1));
      _saleItems = [
        Vegetable(name: 'Red Capcicum', price: 132.00, imagePath: 'assets/vegetables/brinjal.png', rating: 4, category: 'spices'),
        Vegetable(name: 'Tomato', price: 124.00, imagePath: 'assets/vegetables/cabbage.png', rating: 4, category: 'vege'),
        Vegetable(name: 'Green Capcicum', price: 132.00, imagePath: 'assets/vegetables/tomato.png', rating: 3, category: 'vege'),
      ];
    } catch (e) {
      _errorMessage = "Failed to fetch sales items.";
    }

    _isLoading = false;
    notifyListeners();
  }
}
