import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';
import '../../models/vegetable_model.dart';

class SalesCard extends StatelessWidget {
  final Vegetable vegetable;

  const SalesCard({super.key, required this.vegetable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16, top: 8, bottom: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vegetable Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  vegetable.imagePath,
                  height: 60.0,
                  width: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12.0),

              // Vegetable Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vegetable.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          "Rs. ${vegetable.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          "Rs. 200.99",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < vegetable.rating
                              ? Icons.star
                              : Icons.star_outline,
                          color: index < vegetable.rating
                              ? const Color(0xFFFF8A00)
                              : Colors.grey,
                          size: 16,
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // Add to Cart Icon
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: AppColors.primary,
                onPressed: () {
                  // Handle Add to Cart
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
