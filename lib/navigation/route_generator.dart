import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/presentation/screens/primary%20screens/delivery_page.dart';
import 'package:laliguras_shopkeeper/services/auth/forget_password_screen.dart';
import 'package:provider/provider.dart';
import 'package:laliguras_shopkeeper/presentation/screens/primary%20screens/bulkorder_page.dart';
import 'package:laliguras_shopkeeper/presentation/screens/secondary%20screens/profile_setup_page.dart';
import 'package:laliguras_shopkeeper/services/auth/login_screen.dart';
import '../presentation/screens/introduction screens/onboarding_screen.dart';
import '../presentation/screens/introduction screens/splash_screen.dart';
import '../presentation/screens/primary screens/order_page.dart';
import '../presentation/screens/primary screens/search_page.dart';
import '../presentation/screens/primary screens/shopkeeper_homepage.dart';
import '../presentation/screens/secondary screens/cart_page.dart';
import '../presentation/screens/secondary screens/checkout_page.dart';
import '../presentation/screens/secondary screens/payment_page.dart';
import '../presentation/screens/secondary screens/product_details_page.dart';
import '../presentation/screens/secondary screens/sales_page.dart';
import '../providers/delivery_provider.dart';
import '../providers/order_provider.dart';
import '../widgets/delivery_widgets/delivery_data.dart';
import '../widgets/order widgets/order_data.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const ShopkeeperHomepage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/bulk':
        return MaterialPageRoute(builder: (_) => const BulkOrderPage());
      case '/profilesetup':
        return MaterialPageRoute(builder: (_) => const ProfileSetupPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case '/sales':
        return MaterialPageRoute(builder: (_) => const SalesPage());
      case '/basket':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/checkout':
        return MaterialPageRoute(builder: (_) =>  const CheckoutPage());
      case '/payment':
        return MaterialPageRoute(builder: (_) =>  const PaymentPage());
        // case '/forgetPassword':
        // return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case '/productdetails':
        return MaterialPageRoute(builder: (_) => const ProductDetailsPage());


      case '/delivery':
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => DeliveryProvider()..initializeDeliveries(deliveryData),
            child: const DeliveryPage(),
          ),
        );


      case '/orders':
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => OrderProvider()..initializeOrders(initialOrders),
            child: const OrderPage(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
