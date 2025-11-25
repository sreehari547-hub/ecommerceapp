import 'package:flutter/material.dart';
import '../products/product_list.dart';

class AppData extends ChangeNotifier {
  // 🔒 Singleton instance
  static final AppData instance = AppData._internal();
  AppData._internal();
  factory AppData() => instance;


   List<Product> _wishlist = [];
   List<Product> _cart = [];

  List<Product> get wishlist => _wishlist;
  List<Product> get cart => _cart;


  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      if (!_wishlist.contains(product)) _wishlist.add(product);
    } else {
      _wishlist.remove(product);
    }
    notifyListeners();
  }
List<Product> getCartItems() {
  return AppData.instance.cart;
  
}
  
  List<Product> getWishlistItems() {
  return AppData.instance.wishlist;
}

  void addToCart(Product product) {
    if (!_cart.contains(product)) {
      _cart.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
