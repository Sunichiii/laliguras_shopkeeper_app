class Vegetable {
  final int id;
  final String name;
  final double price;
  final String imagePath;
  final double rating;
  final String category;
  final int stock;
  final String description;


  Vegetable({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
    required this.category,
    required this.stock,
    required this.description,
  });

  factory Vegetable.fromJson(Map<String, dynamic> json) {
    return Vegetable(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      imagePath: (json['image'] as List).isNotEmpty ? json['image'][0] : '',
      rating: json['ratings'] != null ? json['ratings'].toDouble() : 0.0,
      category: json['category'] ?? 'Unknown',
      stock: json['stock'],
      description: json['description'] ?? '',
    );
  }
}
