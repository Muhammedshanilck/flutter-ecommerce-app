import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/features/screens/cart/view/cart_page.dart';
import 'package:user_auth_app/features/screens/favorites/view/favorites_page.dart';
import 'package:user_auth_app/features/screens/home/view/home_page.dart';
import 'package:user_auth_app/features/screens/profile/view/profile_page.dart';

class EcommerceBottomBar
    extends
        StatefulWidget {
  const EcommerceBottomBar({
    super.key,
  });

  @override
  State<
    EcommerceBottomBar
  >
  createState() => _EcommerceBottomBarState();
}

class _EcommerceBottomBarState
    extends
        State<
          EcommerceBottomBar
        > {
  final List<
    Widget
  >
  pages = const [
    HomePage(),
    FavoritesPage(),
    CartPage(),
    ProfilePage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap:
            (
              index,
            ) {
              setState(
                () {
                  selectedIndex = index;
                },
              );
            },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.ashshade,
        iconSize: 30,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_fill,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_fill,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
