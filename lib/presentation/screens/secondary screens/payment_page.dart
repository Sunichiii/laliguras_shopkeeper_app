import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20buttons/long_button.dart';
import '../../../core/themes/colors.dart';
import '../../../widgets/custom bars/secondary_appbar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPaymentMethod = "Esewa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(title: "Payment"),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, bottom: 40, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Method Options
            _buildPaymentOptionCard("Esewa", context),
            _buildPaymentOptionCard("Cash on delivery", context),
            _buildPaymentOptionCard("Khalti", context),

            const Spacer(),

            // Pay Button
             LongButton(text: "Pay", onPressed: (){})
          ],
        ),
      ),
    );
  }

  // Helper function to build a card for each payment option
  Widget _buildPaymentOptionCard(String paymentMethod, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = paymentMethod;
        });
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                paymentMethod,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Radio<String>(
                value: paymentMethod,
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
