import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/theme_data.dart';
import 'package:store/models/dark_theme_preferences.dart';
import 'package:store/provider/dark_theme_provider.dart';

import 'bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider=DarkThemeProvider();
  void getCurrentAppTheme()async {
    darkThemeProvider.darkTheme=await darkThemeProvider.darkThemePreferences.getDarkTheme();
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
          create: (_)=>darkThemeProvider,

        )
      ],
      child: Consumer<DarkThemeProvider>(

        builder: (context,data,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bottom Navigation bar',
          theme: Styles.themeData(context: context,isDarkTheme:data.darkTheme),
          home: BottomBarScreen(),
        );
        },

      ),
    );
  }
}
