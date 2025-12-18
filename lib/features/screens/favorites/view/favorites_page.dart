import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/features/screens/home/components/bottom_bar.dart';
import 'package:user_auth_app/provider/favorites_provider.dart';

import 'package:user_auth_app/features/screens/home/components/product_card.dart';

class FavoritesPage
    extends
        StatefulWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  State<
    FavoritesPage
  >
  createState() => _FavoritesPageState();
}

class _FavoritesPageState
    extends
        State<
          FavoritesPage
        > {
  @override
  Widget build(
    BuildContext context,
  ) {
    final favorites = context
        .watch<
          FavoritesProvider
        >()
        .favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Wishlist",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            if (Navigator.canPop(
              context,
            )) {
              Navigator.pop(
                context,
              ); // normal back
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (
                        context,
                      ) => const EcommerceBottomBar(),
                ),
              );
            }
          },
        ),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites yet ❤️",
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(
                16,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: favorites.length,
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    final item = favorites[index];
                    return ProductCard(
                      image: item['image']!,
                      category: item['category']!,
                      title: item['title']!,
                      price: item['price']!,
                      oldPrice: item['oldPrice']!,
                      description: item['description']!,
                    );
                  },
            ),
    );
  }
}
