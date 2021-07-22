import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/widget/cart_empty.dart';
import 'package:store/widget/cart_full.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products=[1];
    return products.isEmpty?Scaffold(
        body: CartEmpty()):Scaffold(

      appBar: AppBar(
   //TODO
        title:Text("Cart Item Count"),
        actions: [IconButton(onPressed: (){}, icon: Icon(MyAppIcons.trash))],

      ),
        bottomSheet: checkoutSection(context),
        body: Container(
          margin: EdgeInsets.only(bottom: 60),
          child: ListView.builder(itemCount: 5,
              itemBuilder: (context,index){
            return CartFull();
              }
          ),
        ));
  }

  Widget checkoutSection(BuildContext ctx){
    return Container(
      decoration: BoxDecoration(
        border:Border(top: BorderSide(width: 1,color: Colors.grey),),
      ),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
          Expanded(
            flex:2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(

                    colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd,
                    ],
                    stops: [
                      0.0,
                      0.85,
                    ]

                ),
                  borderRadius: BorderRadius.circular(30),
              ),
              child: Material(

                color: Colors.transparent,

                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("checkout",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w600,

                      color: Theme.of(ctx).textSelectionColor
                    ),
                    ),

                  ),
                ),
              ),
            ),
          ),
              Spacer(),
              Text("Total: ",

                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600,

                    color: Theme.of(ctx).textSelectionColor
                ),
              ),
              Text("Us \$197.00",

                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w500,

                    color: Colors.blue
                ),
              ),
        ]),
      ),
    );
  }
}
