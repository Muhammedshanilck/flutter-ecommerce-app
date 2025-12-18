import 'package:flutter/material.dart';

class CartItem {
  final String image;
  final String title;
  final String category;
  final double price;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.category,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart({
    required String image,
    required String title,
    required String category,
    required double price,
    int quantity = 1,
  }) {
    final index = _items.indexWhere((e) => e.title == title);

    if (index >= 0) {
      _items[index].quantity += quantity;
    } else {
      _items.add(
        CartItem(
          image: image,
          title: title,
          category: category,
          price: price,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void increaseQty(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decreaseQty(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double get subTotal {
    return _items.fold(
      0,
      (sum, item) => sum + item.price * item.quantity,
    );
  }
}
