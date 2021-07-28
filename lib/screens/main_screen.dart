import 'package:flutter/material.dart';
import 'package:store/bottom_bar.dart';
import 'package:store/screens/upload_product_form.dart';



class MainScreens extends StatelessWidget {
  static const routeName = '/MainScreens';
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
