import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/secondary_appbar.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/long_button.dart';
import 'package:provider/provider.dart';
import '../../../core/themes/colors.dart';
import '../../../providers/cart_provider.dart';
import '../../../widgets/custom buttons/quantity_selector_button.dart';

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
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                final vegetable = cartItem['vegetable'];
                final quantity = cartItem['quantity'];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Image.asset(
                        vegetable.imagePath,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        vegetable.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      subtitle: Text(
                        'Rs. ${vegetable.price.toStringAsFixed(2)} x $quantity',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Use QuantitySelector Widget
                          QuantitySelector(
                            quantity: quantity,
                            onAdd: () {
                              cartProvider.updateQuantity(
                                  vegetable, quantity + 1);
                            },
                            onSubtract: () {
                              if (quantity > 1) {
                                cartProvider.updateQuantity(
                                    vegetable, quantity - 1);
                              }
                            },
                          ),
                          const SizedBox(width: 8),
                          // Delete Button
                          IconButton(
                            icon: const Icon(Icons.delete_outline_outlined,
                                color: Colors.red),
                            onPressed: () {
                              cartProvider.removeFromCart(vegetable);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
