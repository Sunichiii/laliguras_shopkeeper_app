import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/vegetable_provider.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1; // Default quantity

  @override
  Widget build(BuildContext context) {
    final vegetableProvider = Provider.of<VegetableProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final vegetable = vegetableProvider.selectedVegetable;

    if (vegetable == null) {
      return const Scaffold(
        appBar: SecondaryAppBar(
          title: "Product Details",
        ),
        body: Center(
          child: Text("No product selected."),
        ),
      );
    }

    return Scaffold(
      appBar: SecondaryAppBar(
        title: vegetable.name,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and Description Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Vegetable Image
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset(
                      vegetable.imagePath,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Vegetable Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vegetable.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < vegetable.rating.toInt()) {
                              return const Icon(Icons.star,
                                  color: Color(0xFFFF8A00), size: 20);
                            } else {
                              return const Icon(Icons.star,
                                  color: Colors.grey, size: 20);
                            }
                          }),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "144 Reviews",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Rs. ${vegetable.price.toStringAsFixed(2)}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Divider
              const Divider(
                thickness: 1,
                height: 32,
                color: AppColors.grey,
              ),

              // Quantity Selector and Add to Cart
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    quantity.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add the selected item to the cart
                      cartProvider.addToCart(vegetable, quantity);

                      // Show a confirmation message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added $quantity ${vegetable.name}(s) to your cart!',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.background),
                    ),
                  ),
                ],
              ),

              // Additional Information Section
              const SizedBox(height: 24),
              Text(
                'Additional Information',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Fresh and high-quality ${vegetable.name} available for purchase.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
