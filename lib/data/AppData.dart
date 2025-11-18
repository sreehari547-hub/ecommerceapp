import 'package:flutter/material.dart';
import '../products/product_list.dart'; 

class AppData extends ChangeNotifier {
  final List<Product> _wishlist = [];
  final List<Product> _cart = [];

  List<Product> get wishlist => _wishlist;
  List<Product> get cart => _cart;

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      if (!_wishlist.contains(product)) {
        _wishlist.add(product);
      }
    } else {
      _wishlist.remove(product);
    }
    notifyListeners();
  }

  void addToCart(Product product) {
    if (!_cart.contains(product)) {
      _cart.add(product);
      notifyListeners();
    }
  }
  void removeFromWishlist(Product product) {
  if (_wishlist.contains(product)) {
    product.isFavorite = false;
    _wishlist.remove(product);
    notifyListeners();
  }
}
void removeFromCart(Product product) {
  if (_cart.contains(product)) {
    _cart.remove(product);
    notifyListeners();
  }
}


}
