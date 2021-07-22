import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:store/widget/feeds_products.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 6,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) =>FeedsProducts(),
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