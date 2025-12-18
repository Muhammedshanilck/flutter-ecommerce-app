import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/provider/favorites_provider.dart';
import 'package:user_auth_app/features/screens/product_details/product_details.dart';


class ProductCard extends StatefulWidget {
  final String image;
  final String category;
  final String title;
  final String price;
  final String oldPrice;
  final String description;

  const ProductCard({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.description,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    final isFavorite =
        favoritesProvider.isFavorite(widget.title);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              image: widget.image,
              title: widget.title,
              price: widget.price,
              oldPrice: widget.oldPrice,
              description: widget.description,
              category: widget.category,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    favoritesProvider.toggleFavorite(
                      image: widget.image,
                      category: widget.category,
                      title: widget.title,
                      price: widget.price,
                      oldPrice: widget.oldPrice,
                      description: widget.description,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          isFavorite ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: Image.asset(
                  widget.image,
                  height: 120,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.category,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.oldPrice,
                    style: const TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
