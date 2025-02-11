import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../providers/bulkorder_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/delivery_provider.dart';
import '../../providers/favourites_provider.dart';
import '../../providers/order_provider.dart';
import '../../providers/profilesetup_provider.dart';
import '../../providers/sales_provider.dart';
import '../../providers/splash_provider.dart';
import '../../providers/navigation_provider.dart';
import '../../providers/onboarding_provider.dart';
import '../../providers/vegetable_provider.dart';
import '../core/injection/injection_container.dart';


List<SingleChildWidget> providers = [
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
  ChangeNotifierProvider(create: (_) => CartProvider()),
  ChangeNotifierProvider(create: (_) => provideAuthProvider()),
];
