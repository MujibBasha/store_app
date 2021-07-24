import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/provider/products.dart';
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
