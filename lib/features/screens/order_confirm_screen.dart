import 'package:flutter/material.dart';
import 'package:user_auth_app/core/constants/app_colors.dart';
import 'package:user_auth_app/features/screens/home/components/bottom_bar.dart';

class OrderConfirmationScreen
    extends
        StatelessWidget {
  const OrderConfirmationScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (
                      context,
                    ) => const EcommerceBottomBar(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  30,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: AppColors.violet,
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Order Confirmation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Your Order is confirmed! Processing now,\nshipping details will follow soon.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
