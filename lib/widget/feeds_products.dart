import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/inner_screens/product_details.dart';

import '../models/product.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,arguments:productsAttributes.id ),
        child: Container(
          width: 250,
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).backgroundColor,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRect(
                      child: Container(

                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 100,
                      maxHeight: MediaQuery.of(context).size.height * 0.22,
                    ),
                    child: Image.network(
                      productsAttributes.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  )),
                  Positioned(
                    // bottom: 0,
                    // right: 1,
                    child: Badge(
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.lightBlueAccent, //indigoAccent cooool
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8)),
                      badgeContent:
                          Text('New', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        productsAttributes.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "\$ ${productsAttributes.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity: ${productsAttributes.quantity}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {},
                              child: Container(
                                  // height:40,
                                  // width: 40,
                                  child: Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
