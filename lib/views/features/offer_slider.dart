import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';

class OfferSlider extends StatelessWidget {
  final List<Map<String, String>> offers;

  const OfferSlider({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0, // Set height for the slider
      child: PageView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                // Image section
                // Text section
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        offer['title'] ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        offer['subtitle'] ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Shop Now",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.background),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    offer['image'] ?? '',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
