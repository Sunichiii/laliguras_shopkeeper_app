import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/api/api_service.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/use_cases/login_usecase.dart';
import 'domain/use_cases/forgot_password_usecase.dart';

import 'providers/auth_provider.dart';
import 'providers/bulkorder_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/delivery_provider.dart';
import 'providers/favourites_provider.dart';
import 'providers/order_provider.dart';
import 'providers/profilesetup_provider.dart';
import 'providers/sales_provider.dart';
import 'providers/splash_provider.dart';
import 'providers/navigation_provider.dart';
import 'providers/onboarding_provider.dart';
import 'providers/vegetable_provider.dart';

import 'core/themes/themes.dart';
import 'navigation/route_generator.dart';



void main() {
  final apiService = ApiService();
  final authRepository = AuthRepository(apiService);
  final loginUseCase = LoginUseCase(authRepository);

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
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider(
        loginUseCase: loginUseCase,
        forgotPasswordUseCase: forgotPasswordUseCase,
      ),
      ),
    
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


