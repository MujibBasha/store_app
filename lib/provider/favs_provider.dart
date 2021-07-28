import 'package:flutter/material.dart';
import 'package:store/models/favs_attr.dart';

class FavsProvider with ChangeNotifier {
  Map<String, FavsAttr> _cartItems = {};

  Map<String, FavsAttr> get getFavsItems {
    return _cartItems;
  }



  void addAndRemoveFromFav(
      String productId, double price, String title, String imageUrl) {
    if (_cartItems.containsKey(productId)) {
      removeItem(productId);
    } else {
      _cartItems.putIfAbsent(productId, () =>
          FavsAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }


  void removeItem(String productTD){
    _cartItems.remove(productTD);
    notifyListeners();
  }

  void clearFavs(){
    _cartItems.clear();
    notifyListeners();
  }
}
