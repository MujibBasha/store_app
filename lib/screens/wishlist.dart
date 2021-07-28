import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/provider/favs_provider.dart';
import 'package:store/services/global_method.dart';
import 'package:store/widget/cart_empty.dart';
import 'package:store/widget/cart_full.dart';
import 'package:store/widget/wishlist_empty.dart';
import 'package:store/widget/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen ';
  @override
  Widget build(BuildContext context) {

final favsProvider=Provider.of<FavsProvider>(context);


    return favsProvider.getFavsItems.isEmpty?Scaffold(
        body: WishlistEmpty()):Scaffold(

appBar: AppBar(title: Text("Wishlist (${favsProvider.getFavsItems.length}) "),


  actions: [
    IconButton(
        onPressed: () {
          // cartProvider.clearCart();

          GlobalMethods.showDialogg("Clear WishList", "your wishList will be cleared", ()=> favsProvider.clearFavs(),context);
        },
        icon: Icon(MyAppIcons.trash))
  ],
),

        body:ListView.builder(
          itemCount: favsProvider.getFavsItems.length  ,
          itemBuilder: (BuildContext ctx,int index){
            return ChangeNotifierProvider.value(
                value:favsProvider.getFavsItems.values.toList()[index] ,
                child: WishlistFull(productId:favsProvider.getFavsItems.keys.toList()[index] ,));
          },), );
  }

}
