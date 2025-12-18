import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/provider/cart_provider.dart';
import 'package:user_auth_app/provider/favorites_provider.dart';
import 'package:user_auth_app/features/screens/home/components/bottom_bar.dart';

void
main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:
              (
                _,
              ) => FavoritesProvider(),
        ),
        ChangeNotifierProvider(
          create:
              (
                _,
              ) => CartProvider(),
        ),
      ],
      child: const ECommerceApp(),
    ),
  );
}

class ECommerceApp
    extends
        StatefulWidget {
  const ECommerceApp({
    super.key,
  });

  @override
  State<
    ECommerceApp
  >
  createState() => _ECommerceAppState();
}

class _ECommerceAppState
    extends
        State<
          ECommerceApp
        > {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      home: EcommerceBottomBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(
          0xffF6F6F6,
        ),
      ),
    );
  }
}
