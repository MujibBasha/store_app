import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/models/cart_attr.dart';
import 'package:store/models/favs_attr.dart';
import 'package:store/models/product.dart';
import 'package:store/provider/cart_provider.dart';
import 'package:store/provider/favs_provider.dart';
import 'package:store/provider/products.dart';
import 'package:store/screens/cart.dart';
import 'package:store/screens/wishlist.dart';
import 'package:store/widget/feeds_products.dart';

class Feeds extends StatefulWidget {
  static const routeName = '/Feeds';
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    final popular=ModalRoute.of(context).settings.arguments as String ;
    final productsProvider = Provider.of<Products>(context);

    List<Product> _productsList = productsProvider.products;
    if(popular == "popular")
    {
      _productsList = productsProvider.popularProducts;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        title:Text("Feeds") ,
        actions: [
          Selector<FavsProvider,Map<String, FavsAttr>>(
            selector: (context,data)=>data.getFavsItems,
            builder: (_,favs,child)=>Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                favs.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(
                  MyAppIcons.wishlist,
                  color: ColorsConsts.favColor,
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(WishlistScreen.routeName);
                },
              ),
            ),
          ),
          Selector<CartProvider,  Map<String, CartAttr>>(
            selector: (context,data)=>data.getCartItems,
            builder: (_,carts,child)=>Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 5, end: 7),
              badgeContent: Text(
                carts.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(
                  MyAppIcons.cart,
                  color: ColorsConsts.cartColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
        body: StaggeredGridView.countBuilder(
      crossAxisCount: 6,
      itemCount: _productsList.length,
      itemBuilder: (BuildContext context, int index) =>
          ChangeNotifierProvider.value(
              value: _productsList[index], child: FeedProducts()),
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
