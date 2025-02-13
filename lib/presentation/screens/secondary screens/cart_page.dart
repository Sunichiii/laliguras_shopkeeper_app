import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/cart_provider.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';
import '../../../widgets/custom buttons/long_button.dart';
//import '../../../widgets/custom buttons/quantity_selector_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: const SecondaryAppBar(title: "Basket"),
      body: cartProvider.cartItems.isEmpty
          ? Center(
        child: Text(
          'Your cart is empty!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      )
          : Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  final vegetable = cartItem['vegetable'];
                  final quantity = cartItem['quantity'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                vegetable.imagePath,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                const Icon(Icons.broken_image,
                                    size: 50),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Product Name & Price
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    vegetable.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Rs. ${vegetable.price.toStringAsFixed(2)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                        color: AppColors.primary),
                                  ),
                                ],
                              ),
                            ),

                            // Quantity Selector & Delete Button
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Subtract Quantity
                                IconButton(
                                  icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red),
                                  onPressed: () {
                                    if (quantity > 1) {
                                      cartProvider.updateQuantity(
                                          vegetable, quantity - 1);
                                    }
                                  },
                                ),
                                Text(
                                  quantity.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                                // Add Quantity
                                IconButton(
                                  icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.green),
                                  onPressed: () {
                                    cartProvider.updateQuantity(
                                        vegetable, quantity + 1);
                                  },
                                ),
                                const SizedBox(width: 8),
                                // Delete Button
                                IconButton(
                                  icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red),
                                  onPressed: () {
                                    cartProvider.removeFromCart(
                                        vegetable);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Rs. ${cartProvider.totalPrice.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                LongButton(
                    text: "Go to Checkout",
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
