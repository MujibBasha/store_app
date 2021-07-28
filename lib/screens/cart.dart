import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/provider/cart_provider.dart';
import 'package:store/services/global_method.dart';
import 'package:store/widget/cart_empty.dart';
import 'package:store/widget/cart_full.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              //TODO
              title: Text("Cart (${cartProvider.getCartItems.length})"),
              actions: [
                IconButton(
                    onPressed: () {
                      // cartProvider.clearCart();

                      GlobalMethods.showDialogg("Clear cart", "your Cart will be cleared", ()=> cartProvider.clearCart(),context);
                    },
                    icon: Icon(MyAppIcons.trash))
              ],
            ),
            bottomSheet: checkoutSection(context,cartProvider.totalAmount),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.values.toList().length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                        child: CartFull(
                          productID:
                              cartProvider.getCartItems.keys.toList()[index],
                        ));
                  }),
            ));
  }

  Widget checkoutSection(BuildContext ctx,double subTitle) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorsConsts.gradiendLStart,
                  ColorsConsts.gradiendLEnd,
                ], stops: [
                  0.0,
                  0.85,
                ]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(ctx).textSelectionColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            "Total: ",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(ctx).textSelectionColor),
          ),
          Text(
            "US \$${subTitle.toStringAsFixed(3)}",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ]),
      ),
    );
  }
}
