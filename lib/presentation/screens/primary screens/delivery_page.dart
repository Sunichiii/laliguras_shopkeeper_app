import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/bottom_navbar.dart';
import 'package:laliguras_shopkeeper/widgets/custom%20bars/secondary_appbar.dart';
import 'package:provider/provider.dart';
import '../../../providers/delivery_provider.dart';
import '../../../views/cards/delivery_card.dart';
import '../../../widgets/custom buttons/requested_accepted_button.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  bool showRequested = true;

  @override
  Widget build(BuildContext context) {
    final deliveries = context.watch<DeliveryProvider>().deliveries;

    return Scaffold(
      appBar: const SecondaryAppBar(title: "Delivery",),
      bottomNavigationBar: const BottomNavbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs (Requested, Accepted)
            Row(
              children: [
                Expanded(
                  child: CustomRequestedAcceptedButton(
                    text: "Requested",
                    isActive: showRequested,
                    onPressed: () {
                      setState(() {
                        showRequested = true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomRequestedAcceptedButton(
                    text: "Accepted",
                    isActive: !showRequested,
                    onPressed: () {
                      setState(() {
                        showRequested = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // List of Delivery Cards
            Expanded(
              child: ListView.builder(
                itemCount: deliveries.length,
                itemBuilder: (context, index) {
                  final delivery = deliveries[index];
                  return DeliveryCard(
                    delivery: delivery,
                    onSendRequest: () {
                      context
                          .read<DeliveryProvider>()
                          .updateDeliveryStep(index, 3); // Update to Delivered
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
