class Delivery {
  final String name;
  final String address;
  final String imagePath;
  final int currentStep; // 0 = Confirmed, 1 = Picking Items, 2 = Out for Delivery, 3 = Delivered

  Delivery({
    required this.name,
    required this.address,
    required this.imagePath,
    required this.currentStep,
  });

  Delivery copyWith({
    String? name,
    String? address,
    String? imagePath,
    int? currentStep,
  }) {
    return Delivery(
      name: name ?? this.name,
      address: address ?? this.address,
      imagePath: imagePath ?? this.imagePath,
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
