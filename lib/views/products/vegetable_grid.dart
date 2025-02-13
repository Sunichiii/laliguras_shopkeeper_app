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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesProvider>().initializeFavorites(vegetables.length);
    });

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Three items per row
        crossAxisSpacing: 10.0, // Increased spacing
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.8, // Adjusted for consistent item sizing
      ),
      itemCount: vegetables.length,
      itemBuilder: (context, index) {
        final vegetable = vegetables[index];
        final isFavorite = context.watch<FavoritesProvider>().favorites[index];

        return GestureDetector(
          onTap: () {
            context.read<VegetableProvider>().setSelectedVegetable(vegetable);
            Navigator.pushNamed(context, '/productdetails');
          },
          child: Stack(
            children: [
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure even spacing
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product Image
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.network(
                          vegetable.imagePath,
                          height: 60.0, // Increased image size for better visibility
                          width: 60.0,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Product Name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          vegetable.name,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2, // Allows slightly longer names
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // Price
                      Text(
                        "Rs. ${vegetable.price.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < vegetable.rating.toInt()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                              size: 14,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Favorite Icon Positioned at the Top Right
              Positioned(
                top: 6.0,
                right: 6.0,
                child: GestureDetector(
                  onTap: () {
                    context.read<FavoritesProvider>().toggleFavorite(index);
                  },
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
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
