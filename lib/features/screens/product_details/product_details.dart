import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/provider/cart_provider.dart';

class ProductDetails
    extends
        StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final String description;
  final String category;

  const ProductDetails({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.description,
    required this.category,
  });

  @override
  State<
    ProductDetails
  >
  createState() => _ProductDetailsState();
}

class _ProductDetailsState
    extends
        State<
          ProductDetails
        > {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red
                  : Colors.black,
            ),
            onPressed: () {
              setState(
                () {
                  isFavorite = !isFavorite;
                },
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: Image.asset(
                widget.image,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                        ),
                        onPressed: () {
                          if (quantity >
                              1) {
                            setState(
                              () => quantity--,
                            );
                          }
                        },
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                        ),
                        onPressed: () {
                          setState(
                            () => quantity++,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const Text(
              "More",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Similar Product",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.05,
                          ),
                          blurRadius: 6,
                          offset: const Offset(
                            0,
                            4,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    isFavorite = !isFavorite;
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(
                                  6,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 6,
                          ),

                          Center(
                            child: Image.asset(
                              widget.image,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          Text(
                            widget.category,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          Row(
                            children: [
                              Text(
                                widget.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                widget.oldPrice,
                                style: const TextStyle(
                                  fontSize: 14,
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
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.05,
                          ),
                          blurRadius: 6,
                          offset: const Offset(
                            0,
                            4,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    isFavorite = !isFavorite;
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(
                                  6,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 6,
                          ),

                          Center(
                            child: Image.asset(
                              widget.image,
                              height: 120,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          Text(
                            widget.category,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),

                          const SizedBox(
                            height: 4,
                          ),

                          Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(
                            height: 8,
                          ),

                          Row(
                            children: [
                              Text(
                                widget.price,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                widget.oldPrice,
                                style: const TextStyle(
                                  fontSize: 14,
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
                ),
              ],
            ),

            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(
          16,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.05,
              ),
              blurRadius: 10,
              offset: const Offset(
                0,
                -3,
              ),
            ),
          ],
        ),
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              final cart = context
                  .read<
                    CartProvider
                  >();

              cart.addToCart(
                image: widget.image,
                title: widget.title,
                category: widget.category,
                price: double.parse(
                  widget.price.replaceAll(
                    "\$",
                    "",
                  ),
                ),
                quantity: quantity,
              );

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Added to cart",
                  ),
                ),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  14,
                ),
              ),
            ),
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
