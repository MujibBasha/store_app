import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/theme_data.dart';
import 'package:store/inner_screens/category_feeds.dart';
import 'package:store/inner_screens/product_details.dart';
import 'package:store/provider/cart_provider.dart';
import 'package:store/provider/dark_theme_provider.dart';
import 'package:store/provider/favs_provider.dart';
import 'package:store/provider/products.dart';
import 'package:store/screens/auth/login.dart';
import 'package:store/screens/auth/sign_up.dart';
import 'package:store/screens/cart.dart';
import 'package:store/screens/feeds.dart';
import 'package:store/screens/main_screen.dart';
import 'package:store/screens/upload_product_form.dart';
import 'package:store/screens/user_state.dart';
import 'package:store/screens/wishlist.dart';

import 'bottom_bar.dart';
import 'inner_screens/brands_navigation_rail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePreferences.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => darkThemeProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavsProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, data, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bottom Navigation bar',
            theme:
                Styles.themeData(context: context, isDarkTheme: data.darkTheme),
            home: UserState(),
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              Feeds.routeName: (ctx) => Feeds(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
              LoginScreen.routeName: (ctx) => LoginScreen(),
              SignUpScreen.routeName: (ctx) => SignUpScreen(),
              BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
              UploadProductForm.routeName: (ctx) => UploadProductForm(),
              MainScreens.routeName: (ctx) => MainScreens(),
              // ForgetPassword.routeName: (ctx) => ForgetPassword(),
              // OrderScreen.routeName: (ctx) => OrderScreen(),
            },
          );
        },
      ),
    );
  }
}
