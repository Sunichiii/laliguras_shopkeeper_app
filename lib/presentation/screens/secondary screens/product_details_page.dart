import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/add_to_cart_button.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/vegetable_provider.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';
import '../../../widgets/custom buttons/quantity_selector_inverse.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1; // Default quantity

  // Long description applicable to all vegetables
  final String longDescription =
      "Our vegetables are sourced directly from local farmers, ensuring freshness and quality. Packed with essential nutrients, vitamins, and minerals, these vegetables are perfect for creating healthy and delicious meals for your family. Enjoy the best produce at affordable prices";

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
                  // Vegetable Image with Circular Rectangular Border
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
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
                        const SizedBox(height: 16),
                        // Quantity Selector and Add to Cart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            QuantitySelectorInverse(
                              quantity: quantity,
                              onAdd: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              onSubtract: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            AddToCartButtonButton(
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
                              text: 'Add to Cart',
                            ),
                          ],
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
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),

              // Long Description Section
              Text(
                longDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
