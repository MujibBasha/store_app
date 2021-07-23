import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/widget/cart_empty.dart';
import 'package:store/widget/cart_full.dart';
import 'package:store/widget/wishlist_empty.dart';
import 'package:store/widget/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen ';
  @override
  Widget build(BuildContext context) {
    List wishlistList=[];
    return wishlistList.isNotEmpty?Scaffold(
        body: WishlistEmpty()):Scaffold(

appBar: AppBar(title: Text("Wishlist () "),),

        body:ListView.builder(

          itemCount: 5  ,
          itemBuilder: (BuildContext ctx,int index){
            return WishlistFull();
          },), );
  }

}
