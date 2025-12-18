import 'package:user_auth_app/core/constants/app_images.dart';
import 'package:user_auth_app/features/screens/home/components/product_card.dart';

final List<
  ProductCard
>
products = [
  ProductCard(
    image: AppImages.iphone13,
    category: "Electronics",
    title: "iPhone 13 Pro",
    price: "\$999.00",
    oldPrice: "\$1099.00",
    description:
        "The iPhone 13 Pro features a powerful A15 Bionic chip, ProMotion display, "
        "and a pro-level camera system for stunning photos and videos.",
  ),
  ProductCard(
    image: AppImages.shoes1,
    category: "Footwear",
    title: "Nike Shoes",
    price: "\$120.00",
    oldPrice: "\$150.00",
    description:
        "Nike shoes designed for ultimate comfort and performance with lightweight "
        "materials and responsive cushioning for everyday use.",
  ),
  ProductCard(
    image: AppImages.jacket,
    category: "Outerwear Men",
    title: "Brown Jacket",
    price: "\$83.00",
    oldPrice: "\$95.00",
    description:
        "Stylish brown jacket made with premium fabric to keep you warm and comfortable "
        "during cold weather while maintaining a modern look.",
  ),
  ProductCard(
    image: AppImages.watch,
    category: "Accessories",
    title: "Watch",
    price: "\$200.00",
    oldPrice: "\$250.00",
    description:
        "Elegant wristwatch featuring a sleek design, durable build, and precise timekeeping "
        "for both casual and formal wear.",
  ),
];
