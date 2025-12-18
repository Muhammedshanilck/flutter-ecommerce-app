import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/features/screens/home/components/bottom_bar.dart';
import 'package:user_auth_app/features/screens/order_confirm_screen.dart';
import 'package:user_auth_app/provider/cart_provider.dart';

class CartPage
    extends
        StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<
    CartPage
  >
  createState() => _CartPageState();
}

class _CartPageState
    extends
        State<
          CartPage
        > {
  final TextEditingController _discountController = TextEditingController();
  double discountPercent = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final cart = context
        .watch<
          CartProvider
        >();

    double subTotal = cart.subTotal;
    double discountAmount =
        subTotal *
        (discountPercent /
            100);
    double total =
        subTotal -
        discountAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            if (Navigator.canPop(
              context,
            )) {
              Navigator.pop(
                context,
              );
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

      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty",
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    itemCount: cart.items.length,
                    itemBuilder:
                        (
                          context,
                          index,
                        ) {
                          final item = cart.items[index];

                          return Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),
                            padding: const EdgeInsets.all(
                              23,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                              border: Border.all(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    item.image,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        item.category,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "\$${item.price.toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Row(
                                  children: [
                                    qtyButton(
                                      icon: Icons.remove,
                                      onTap: () => cart.decreaseQty(
                                        index,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        item.quantity.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    qtyButton(
                                      icon: Icons.add,
                                      onTap: () => cart.increaseQty(
                                        index,
                                      ),
                                    ),
                                  ],
                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => cart.removeItem(
                                    index,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        24,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _discountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter Discount Percentage (%)",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<
                                    Color?
                                  >(
                                    AppColors.white,
                                  ),
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  discountPercent =
                                      double.tryParse(
                                        _discountController.text,
                                      ) ??
                                      0;
                                },
                              );
                            },
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),

                      priceRow(
                        "Sub total :",
                        subTotal,
                      ),
                      priceRow(
                        "Discount :",
                        -discountAmount,
                      ),
                      const Divider(),
                      priceRow(
                        "Total :",
                        total,
                        isBold: true,
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (
                                      context,
                                    ) => const OrderConfirmationScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget qtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 28,
      width: 28,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget priceRow(
    String label,
    double amount, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: isBold
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
