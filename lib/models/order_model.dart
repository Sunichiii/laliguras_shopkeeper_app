class Order {
  final String name;
  final String address;
  final String imagePath;
  final int currentStep;
  // 0 = Confirmed, 1 = Picking Items, 2 = Out for Delivery, 3 = Delivered

  Order({
    required this.name,
    required this.address,
    required this.imagePath,
    required this.currentStep,
  });

  // CopyWith method for later on
  Order copyWith({
    String? name,
    String? address,
    String? imagePath,
    int? currentStep,
  }) {
    return Order(
      name: name ?? this.name,
      address: address ?? this.address,
      imagePath: imagePath ?? this.imagePath,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
