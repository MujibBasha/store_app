import 'package:flutter/material.dart';
import 'package:store/models/cart_attr.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};

  Map<String, CartAttr> get getCartItems {
    return _cartItems;
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addProductToCart(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (exitingCardItem) => CartAttr(
              id: exitingCardItem.id,
              title: exitingCardItem.title,
              quantity: exitingCardItem.quantity+1,
              price: exitingCardItem.price,
              imageUrl: exitingCardItem.imageUrl));
    } else {
      _cartItems.putIfAbsent(productId, () =>
          CartAttr(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
          imageUrl: imageUrl));
    }
    notifyListeners();
  }

  void reduceItemByOne(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
              (exitingCardItem) =>
              CartAttr(
                  id: exitingCardItem.id,
                  title: exitingCardItem.title,
                  quantity: exitingCardItem.quantity - 1,
                  price: exitingCardItem.price,
                  imageUrl: exitingCardItem.imageUrl));
    }
    notifyListeners();
  }

  void removeItem(String productTD){
    _cartItems.remove(productTD);
    notifyListeners();
  }

  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }
  }
