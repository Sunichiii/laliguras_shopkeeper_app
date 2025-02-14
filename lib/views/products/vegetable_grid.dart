import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/themes/colors.dart';
import '../../models/vegetable_model.dart';
import '../../providers/favourites_provider.dart';
import '../../providers/vegetable_provider.dart';

class VegetableGrid extends StatelessWidget {
  final List<Vegetable> vegetables;

  const VegetableGrid({super.key, required this.vegetables});

  @override
  Widget build(BuildContext context) {
    // Initialize favorites in the provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesProvider>().initializeFavorites(vegetables.length);
    });

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: vegetables.length,
      itemBuilder: (context, index) {
        final vegetable = vegetables[index];
        final isFavorite = context.watch<FavoritesProvider>().favorites[index];

        return GestureDetector(
          onTap: () {
            // Set the selected vegetable in the provider
            context.read<VegetableProvider>().setSelectedVegetable(vegetable);

            // Navigate to the product details page
            Navigator.pushNamed(context, '/productdetails');
          },
          child: Stack(
            children: [
              // Main Container
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      vegetable.imagePath,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      vegetable.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Rs. ${vegetable.price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (starIndex) {
                        if (starIndex < vegetable.rating.toInt()) {
                          return const Icon(Icons.star,
                              color: Color(0xFFFF8A00), size: 16);
                        } else {
                          return const Icon(Icons.star,
                              color: Colors.grey, size: 16);
                        }
                      }),
                    ),
                  ],
                ),
              ),
              // Favorite Button (Top-Right)
              Positioned(
                top: 8.0,
                right: 8.0,
                child: GestureDetector(
                  onTap: () {
                    context.read<FavoritesProvider>().toggleFavorite(index);
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
