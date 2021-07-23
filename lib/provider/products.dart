
import 'package:flutter/material.dart';
import 'package:store/models/product.dart';


class Products extends ChangeNotifier{


  List<Product> _product=[

    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "lbljd dflkndk Galaxy S9 G960U",
      price: 00.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 99,
      isPopular: false,),
    Product(id: "SamSung1",
      title: " Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 20.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
    Product(id: "SamSung1",
      title: "Samsung Galaxy S9",
      description: "Samsung Galaxy S9 G960U",
      price: 50.99,
      imageUrl: "assets/images/user_Image.jpg",
      brand: "dbskjdb",
      productCategoryName: "phone Case",
      quantity: 56,
      isPopular: false,),
  ];


  List<Product> get products{
    return _product;
  }
}