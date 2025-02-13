import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/vegetable_provider.dart';
import '../../../views/features/offer_slider.dart';
import '../../../views/products/vegetable_grid.dart';
import '../../../widgets/custom%20bars/homepage_appbar.dart';
import '../../../widgets/custom%20bars/bottom_navbar.dart';
import '../../../widgets/custom%20buttons/basket_button.dart';

class ShopkeeperHomepage extends StatelessWidget {
  const ShopkeeperHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final vegetableProvider = Provider.of<VegetableProvider>(context);

    if (vegetableProvider.vegetables.isEmpty && !vegetableProvider.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vegetableProvider.fetchVegetables();
      });
    }

    return Scaffold(
      appBar: HomepageAppbar(onSetupTap: () {
        Navigator.pushNamed(context, '/profilesetup');
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Offer Slider
              const OfferSlider(
                offers: [
                  {
                    "title": "Up to 30% offer",
                    "subtitle": "Enjoy our big offer",
                    "image": "assets/images/offer1.png",
                  },
                  {
                    "title": "Buy 1 Get 1 Free",
                    "subtitle": "On select items!",
                    "image": "assets/images/offer2.png",
                  },
                ],
              ),
              const SizedBox(height: 16.0),

              Text(
                "Vegetables",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),

              vegetableProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : vegetableProvider.errorMessage != null
                  ? Center(
                child: Text(
                  vegetableProvider.errorMessage!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
                  : VegetableGrid(vegetables: vegetableProvider.vegetables),
            ],
          ),
        ),
      ),
      floatingActionButton: const BasketButton(),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
