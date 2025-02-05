class Vegetable {
  final String name;
  final double price;
  final String imagePath;
  final double rating;
  final String category;
  final int quantity;

  Vegetable({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.category,
    this.quantity = 1,
  });


  Vegetable copyWith({
    String? name,
    double? price,
    String? imagePath,
    double? rating,
    int? quantity,
  }) {
    return Vegetable(
      name: name ?? this.name,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
    );
  }

}