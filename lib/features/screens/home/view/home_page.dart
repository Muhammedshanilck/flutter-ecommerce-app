import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/core/utils/product_data.dart';
import 'package:user_auth_app/features/screens/home/components/banner.dart';

import 'package:user_auth_app/features/screens/home/components/product_card.dart';
import 'package:user_auth_app/features/screens/home/components/product_categories.dart';

class HomePage
    extends
        StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<
    HomePage
  >
  createState() => _HomePageState();
}

class _HomePageState
    extends
        State<
          HomePage
        > {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
          
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(
                  18.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 60,
                      width: 55,
                      color: AppColors.greyshade,
                      child: Icon(
                        CupertinoIcons.bell,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),

           
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),

         
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            SliverToBoxAdapter(
              child: ProductCategories(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            
            SliverPadding(
              padding: EdgeInsets.all(
                16,
              ),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65, 
                ),
                delegate: SliverChildBuilderDelegate(
                  (
                    context,
                    index,
                  ) {
                    return ProductCard(
                      image: products[index].image,
                      category: products[index].category,
                      title: products[index].title,
                      price: products[index].price,
                      oldPrice: products[index].oldPrice,
                      description: products[index].description,
                    );
                  },
                  childCount: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
