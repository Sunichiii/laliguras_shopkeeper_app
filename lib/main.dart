import 'package:flutter/material.dart';
import 'package:laliguras_shopkeeper/providers/provider_list.dart';
import 'package:provider/provider.dart';

import 'core/themes/themes.dart';
import 'navigation/route_generator.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        initialRoute: '/splash',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    ),
  );
}
