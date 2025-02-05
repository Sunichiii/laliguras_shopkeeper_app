import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/views/cards/address_card.dart';
import 'package:laliguras_shopkeeper/views/cards/checkout_card.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/long_button.dart';
import '../../../core/themes/colors.dart';
import '../../../views/cards/order_summary_card.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool requestInvoice = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: "Checkout"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Details Section
              Text(
                "Details",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              const CheckoutCard(),
              const SizedBox(height: 16),

              // Address Section
              Text(
                "Address",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),

              const AddressCard(),

              const SizedBox(height: 16),

              // Coupon Code Section
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.local_offer_outlined,
                      color: AppColors.primary),
                  hintText: "Enter Coupon Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                ),
              ),

              const SizedBox(height: 16),

              // Order Summary Section
              Text(
                "Order Summary",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const OrderSummaryCard(),

              const SizedBox(height: 16),

              // Request Invoice Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Request an invoice",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch(
                    value: requestInvoice,
                    onChanged: (value) {
                      setState(() {
                        requestInvoice = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Pay Now Button
              LongButton(
                text: "Pay Now",
                onPressed: () {
                  Navigator.pushNamed(context, '/payment');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Processing payment...")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
