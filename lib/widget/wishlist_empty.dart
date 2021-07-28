import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/provider/dark_theme_provider.dart';
import 'package:store/screens/feeds.dart';

class WishlistEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/empty-wishlist.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Text("Your Wishlist Is Empty",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textSelectionColor),),
        SizedBox(height: 30,),
        Text("Explore more and shortlist some items",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: themeChange.darkTheme?Theme.of(context).disabledColor:ColorsConsts.subTitle,),),
        SizedBox(height: 30,),
        Container(
          height: MediaQuery.of(context).size.height*0.06,
          width: MediaQuery.of(context).size.width*0.9,
          child: RaisedButton(onPressed: ()=> Navigator.pushNamed(context,Feeds.routeName ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red),

            ),
            color: Colors.redAccent,
            child: Text("Add a wish".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textSelectionColor),),
          ),
        )
      ],
    );
  }
}
