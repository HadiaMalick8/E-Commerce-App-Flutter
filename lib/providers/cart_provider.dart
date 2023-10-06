import 'package:flutter/cupertino.dart';

import '../models/bags.dart';
import '../models/cart.dart';
import '../models/products.dart';

class CartProvider extends ChangeNotifier{

  final List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  List<Product> userCart = [];

  List<Product> productList = productsCart;

  List<Product> getUserCart() {
    return userCart;
  }

  double get totalCartPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  double calculateSubTotal() {
    double total = 0.0;
    for (var item in _cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  double calculateTotalAmount() {
    double totalAmount = 0;
    for (var item in _cartItems) {
      totalAmount += (item.product.price * item.quantity);
    }
    return totalAmount;
  }

  void addProductToCart(Product product) {
    int existingItemIndex = -1;

    for (int i = 0; i < _cartItems.length; i++) {
      if (_cartItems[i].product == product) {
        existingItemIndex = i;
        break;
      }
    }

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity += 1;
    } else {
      _cartItems.add(Cart(product: product));
    }

    notifyListeners();
  }
  //
  // //add bags to the cart
  // void addBagsToCart(Bags bags) {
  //   int existingItemIndex = -1;
  //
  //   for (int i = 0; i < _cartItems.length; i++) {
  //     if (_cartItems[i].product == bags) {
  //       existingItemIndex = i;
  //       break;
  //     }
  //   }
  //
  //   if (existingItemIndex != -1) {
  //     _cartItems[existingItemIndex].quantity += 1;
  //   } else {
  //     _cartItems.add(Cart(product: null));
  //   }
  //
  //   notifyListeners();
  // }

  void removeProductFromCart(Product product) {
    final existingIndex = _cartItems.indexWhere((item) => item.product == product);

    if (existingIndex != -1) {
      final existingItem = _cartItems[existingIndex];

      if (existingItem.quantity > 1) {
        existingItem.quantity -= 1;
      } else {
        _cartItems.removeAt(existingIndex);
      }

      notifyListeners();
    }
  }

  void updateCartItemQuantity(Cart cartItem, int newQuantity) {
    final existingItemIndex = _cartItems.indexWhere((item) => item == cartItem);

    if (existingItemIndex != -1) {
      _cartItems[existingItemIndex].quantity = newQuantity;
      notifyListeners();
    }
  }

}


List<Product> productsCart = products;
