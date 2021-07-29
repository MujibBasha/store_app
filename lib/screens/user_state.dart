import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/screens/landing_page.dart';
import 'package:store/screens/main_screen.dart';

class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (userSnapshot.connectionState == ConnectionState.active) {
            return MainScreens();
          } else if (userSnapshot.hasError) {
            return LandingPage();
          }

          return LandingPage();
        });
  }
}
