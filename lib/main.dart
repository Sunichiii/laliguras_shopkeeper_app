import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/providers/bulkorder_provider.dart';
import 'package:laliguras_shopkeeper/providers/delivery_provider.dart';
import 'package:laliguras_shopkeeper/providers/favourites_provider.dart';
import 'package:laliguras_shopkeeper/providers/order_provider.dart';
import 'package:laliguras_shopkeeper/providers/profilesetup_provider.dart';
import 'package:laliguras_shopkeeper/providers/sales_provider.dart';
import 'package:laliguras_shopkeeper/providers/splash_provider.dart';
import 'package:laliguras_shopkeeper/providers/navigation_provider.dart';
import 'package:laliguras_shopkeeper/providers/onboarding_provider.dart';
import 'package:laliguras_shopkeeper/providers/vegetable_provider.dart';
import 'package:provider/provider.dart';
import 'core/themes/themes.dart';
import 'navigation/route_generator.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => SplashProvider()),
      ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ChangeNotifierProvider(create: (_) => VegetableProvider()),
      ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ChangeNotifierProvider(create: (_) => BulkOrderProvider()),
      ChangeNotifierProvider(create: (_) => ProfileSetupProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
      ChangeNotifierProvider(create: (_) => DeliveryProvider()),
      ChangeNotifierProvider(create: (_) => SalesProvider()),
    //  ChangeNotifierProvider(create: (_) => BasketProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  ));
}


