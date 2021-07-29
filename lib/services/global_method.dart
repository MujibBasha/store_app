import 'package:flutter/material.dart';

class GlobalMethods {
  static Future<void> showDialogg(
      String title, String subTitle, Function fct, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.asset(
                    "assets/images/Profile.jpg",
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                )
              ],
            ),
            content: Text(subTitle),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    fct();
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  static Future<void> authErrorHandle(
      String subTitle, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.network(
                    "src",
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
            content: Text(subTitle),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }
}
