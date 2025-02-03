import 'package:flutter/material.dart';
import '../models/delivery_model.dart';

class DeliveryProvider extends ChangeNotifier {
  List<Delivery> _deliveries = [];

  List<Delivery> get deliveries => _deliveries;

  void initializeDeliveries(List<Delivery> deliveryData) {
    _deliveries = deliveryData;
    notifyListeners();
  }

  void updateDeliveryStep(int index, int step) {
    _deliveries[index] = _deliveries[index].copyWith(currentStep: step);
    notifyListeners();
  }
}
