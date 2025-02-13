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
        crossAxisCount: 3, // Three items per row
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppColors.border),
                ),
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Image.network(
                          vegetable.imagePath,
                          height: 60.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 60),
                        ),
                      ),
                      const SizedBox(height: 8.0),


                      Text(
                        vegetable.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),


                      Text(
                        "Rs. ${vegetable.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              color: starIndex < vegetable.rating.toInt()
                                  ? const Color(0xffff8a00) // Orange for selected stars
                                  : Colors.grey, // Grey for unselected stars
                              size: 16,
                            );
                          }),
                        ),
                      ),

                    ],
                  ),
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
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : AppColors.primary,
                      size: 18.0,
                    ),
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
