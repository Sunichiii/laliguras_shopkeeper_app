import 'package:flutter/material.dart';
import '../models/vegetable_model.dart';
import '../views/repositories/vegetable_repositories.dart';

class VegetableProvider with ChangeNotifier {
  final VegetableRepository repository = VegetableRepository();
  List<Vegetable> _vegetables = [];
  List<Vegetable> _filteredVegetables = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Vegetable> get vegetables => _vegetables;
  List<Vegetable> get filteredVegetables => _filteredVegetables;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchVegetables() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _vegetables = await repository.fetchVegetables();
      _filteredVegetables = _vegetables;
    } catch (e) {
      _errorMessage = "Failed to load data.";
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchVegetables(String query) {
    if (query.isEmpty) {
      _filteredVegetables = _vegetables;
    } else {
      _filteredVegetables = _vegetables
          .where((veg) => veg.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void filterByCategory(String category) {
    _filteredVegetables = _vegetables
        .where((veg) => veg.category.toLowerCase() == category.toLowerCase())
        .toList();
    notifyListeners();
  }

  void sortVegetablesByPrice({bool ascending = true}) {
    _filteredVegetables.sort((a, b) =>
    ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    notifyListeners();
  }

  void sortVegetablesByRating({bool ascending = true}) {
    _filteredVegetables.sort((a, b) =>
    ascending ? a.rating.compareTo(b.rating) : b.rating.compareTo(a.rating));
    notifyListeners();
  }

  void resetFilters() {
    _filteredVegetables = _vegetables;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
