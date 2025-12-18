import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/core/utils/categories_data.dart';

class ProductCategories
    extends
        StatefulWidget {
  const ProductCategories({
    super.key,
  });

  @override
  State<
    ProductCategories
  >
  createState() => _ProductCategoriesState();
}

class _ProductCategoriesState
    extends
        State<
          ProductCategories
        > {
  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 165,
      width: double.infinity,
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  "See more",
                  style: TextStyle(
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

    
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              itemBuilder:
                  (
                    context,
                    index,
                  ) {
                    return buildCategoryItem(
                      categories[index]["name"]!,
                      categories[index]["image"]!,
                    );
                  },
            ),
          ),
        ],
      ),
    );
  }
}

Widget
buildCategoryItem(
  String name,
  String imagePath,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: Column(
      children: [
        // CIRCLE BOX
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Image.asset(
              imagePath,
            ),
          ),
        ),

        SizedBox(
          height: 6,
        ),

        // CATEGORY NAME
        Text(
          name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
