import 'package:flutter/material.dart';
import '../models/vegetable_model.dart';
import '../views/repositories/vegetable_repositories.dart';

class VegetableProvider with ChangeNotifier {
  final VegetableRepository repository = VegetableRepository();
  List<Vegetable> _vegetables = [];
  bool _isLoading = false;
  String? _errorMessage;
  Vegetable? _selectedVegetable;

  List<Vegetable> get vegetables => _vegetables;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Vegetable? get selectedVegetable => _selectedVegetable;

  Future<void> fetchVegetables() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _vegetables = await repository.fetchVegetables();
    } catch (e) {
      _errorMessage = "Failed to load products. Please try again.";
    }

    _isLoading = false;
    notifyListeners();
  }

  void setSelectedVegetable(Vegetable vegetable) {
    _selectedVegetable = vegetable;
    notifyListeners();
  }
}
