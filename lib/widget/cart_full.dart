import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/inner_screens/product_details.dart';
import 'package:store/models/cart_attr.dart';
import 'package:store/provider/cart_provider.dart';
import 'package:store/provider/dark_theme_provider.dart';
import 'package:store/services/global_method.dart';

class CartFull extends StatefulWidget {

final String productID;

  const CartFull({ @required this.productID}) ;

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  

  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
    final cartAttr=Provider.of<CartAttr>(context);
    final cartProvider=Provider.of<CartProvider>(context);
    double subTotal= cartAttr.price * cartAttr.quantity;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,arguments:widget.productID ),
      child: Container(
          height:140,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,

          borderRadius:const  BorderRadius.only(topRight: Radius.circular(16.0),
          bottomRight: const Radius.circular(16.0),),
        ),
        child:Row(
          children:[
            Container(
              width: 130,
              decoration: BoxDecoration(
                image:DecorationImage(
                  image:  NetworkImage(cartAttr.imageUrl),
                  fit: BoxFit.contain,
                )
              ),
            ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children:[
                        Flexible(
                          child: Text(cartAttr.title,
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                            maxLines:1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                       Material(
                         color: Colors.transparent,
                         child: InkWell(
                           borderRadius: BorderRadius.only(topRight: Radius.circular(16),),
                           onTap: (){

                             GlobalMethods.showDialogg("Remove item", "Product will be removed from cart", (){  cartProvider.removeItem(widget.productID);},context);
                           },
                           child:Container(
                               height:40,
                               width: 40,
                               child: Icon(Entypo.cross,color: Colors.red,size: 22,)),

                         ),
                       )
                       // IconButton(onPressed: (){}, icon: Icon(Icons.delete),splashColor: Colors.green,),

                      ]
                    ),
                    Row(
                      children: [
                        Text("Price:"),
                        SizedBox(width: 5,),
                        Text("${cartAttr.price}\$",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Sub Total:"),
                        SizedBox(width: 5,),
                        Text("${subTotal.toStringAsFixed(2)}\$",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).accentColor ),),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 5,),
                        Text("ships Free",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).accentColor ),),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            onTap: cartAttr.quantity<2? null: () {
                              cartProvider.reduceItemByOne(
                                  widget.productID,
                                 );
                            },
                            child:Container(

                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Entypo.minus,
                                    color:cartAttr.quantity<2?Colors.grey: Colors.red,
                                    size: 22,
                                  ),
                                ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 12,
                          child:Container(
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
                            ),
                            width: MediaQuery.of(context).size.width*0.12,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cartAttr.quantity.toString(),textAlign: TextAlign.center,),

                          )



                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            onTap: () {
                              cartProvider.addProductToCart(
                                  widget.productID,
                                  cartAttr.price,
                                  cartAttr.title,
                                  cartAttr.imageUrl);
                            },
                            child:Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.plus,
                                  color: Colors.green,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}
