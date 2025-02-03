import '../../models/vegetable_model.dart';

class VegetableRepository {
  Future<List<Vegetable>> fetchVegetables() async {
    return [
      Vegetable(
        name: "Capsicum",
        price: 140.99,
        imagePath: "assets/vegetables/capsicum.png",
        rating: 3,
        category: "Vegetables", // Add category
      ),
      Vegetable(
        name: "Brinjal",
        price: 140.99,
        imagePath: "assets/vegetables/brinjal.png",
        rating: 2,
        category: "Vegetables", // Add category
      ),
      Vegetable(
        name: "Chilly",
        price: 140.99,
        imagePath: "assets/vegetables/chilly.png",
        rating: 4,
        category: "Spices", // Add category
      ),
      Vegetable(
        name: "Lady Finger",
        price: 140.99,
        imagePath: "assets/vegetables/ladyfinger.png",
        rating: 1,
        category: "Vegetables", // Add category
      ),
      Vegetable(
        name: "Cabbage",
        price: 140.99,
        imagePath: "assets/vegetables/cabbage.png",
        rating: 5,
        category: "Leafy", // Add category
      ),
      Vegetable(
        name: "Onion",
        price: 140.99,
        imagePath: "assets/vegetables/onion.png",
        rating: 4,
        category: "Roots", // Add category
      ),
      Vegetable(
        name: "Potato",
        price: 140.99,
        imagePath: "assets/vegetables/potato.png",
        rating: 2,
        category: "Roots", // Add category
      ),
      Vegetable(
        name: "Tomato",
        price: 140.99,
        imagePath: "assets/vegetables/tomato.png",
        rating: 4,
        category: "Vegetables", // Add category
      ),
    ];
  }
}
