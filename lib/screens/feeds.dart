import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store/models/product.dart';
import 'package:store/widget/feeds_products.dart';

class Feeds extends StatefulWidget {
  static const routeName = '/Feeds';
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 6,
          itemCount: _product.length,
          itemBuilder: (BuildContext context, int index) =>FeedProducts(id: _product[index].id, title: _product[index].title, description: _product[index].description, price: _product[index].price, imageUrl: _product[index].imageUrl, quantity: _product[index].quantity, isFavorite: _product[index].isFavorite),
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(3, index.isEven ? 4 : 4.1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 6.0,
        )

    //     GridView.count(
    //       crossAxisCount: 2,
    //       crossAxisSpacing:8 ,
    //       mainAxisSpacing: 8,
    //       childAspectRatio: 240/290,
    //       children: List.generate(10, (index) => FeedsProducts()),
    // )
    );
  }
}
