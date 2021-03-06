import 'package:backdrop/backdrop.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/inner_screens/brands_navigation_rail.dart';
import 'package:store/provider/products.dart';
import 'package:store/screens/feeds.dart';
import 'package:store/widget/backlayer.dart';
import 'package:store/widget/category.dart';
import 'package:store/widget/popular_products.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _carouselImage = [
    "https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg",
    "https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg",
    "assets/images/user_Image.jpg"
  ];

  List _brandImages = [
    "assets/images/user_Image.jpg",
    "assets/images/user_Image.jpg",
    "assets/images/user_Image.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    final popularItems=productsData.popularProducts;

    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerHeight: MediaQuery.of(context).size.height * 0.25,
          appBar: BackdropAppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                ColorsConsts.starterColor,
                ColorsConsts.endColor,
              ])),
            ),
            title: Text("Home"),
            leading: BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 15,
                padding: EdgeInsets.all(10),
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage: AssetImage("assets/images/Profile.jpg"),
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
          backLayer: BackLayerMenu(),
          frontLayer: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 190.0,
                    width: double.infinity,
                    child: Carousel(
                      images: [
                        NetworkImage(_carouselImage[0]),
                        NetworkImage(_carouselImage[1]),
                        ExactAssetImage(_carouselImage[2]),
                      ],
                      boxFit: BoxFit.fill,
                      dotIncreasedColor: Colors.blue,
                      autoplay: true,
                      dotSize: 5.0,
                      dotSpacing: 15.0,
                      showIndicator: true,
                      // dotColor: Colors.lightGreenAccent,
                      indicatorBgPadding: 7.0,
                      dotBgColor: Colors.black.withOpacity(0.2),
                      borderRadius: true,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Brands',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'View all...',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 210,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Swiper(
                    itemCount: _brandImages.length,
                    autoplay: true,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    onTap: (index) {
                      Navigator.of(context).pushNamed(
                          BrandNavigationRailScreen.routeName,
                          arguments: {index});
                    },
                    itemBuilder: (BuildContext ctx, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.blueGrey,
                          child: Image.asset(
                            _brandImages[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryWidget(
                        index: index,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Products',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Feeds.routeName, arguments: 'popular');//BrandNavigationRailScreen
                        },
                        child: Text(
                          'View all...',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 285,
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularItems.length, //popularItems.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ChangeNotifierProvider.value(
                          value: popularItems[index],
                          child: PopularProducts(
                              // imageUrl: popularItems[index].imageUrl,
                              // title: popularItems[index].title,
                              // description: popularItems[index].description,
                              // price: popularItems[index].price,
                              ),
                        );

                        //   ChangeNotifierProvider.value(
                        //   value: popularItems[index],
                        //   child: PopularProducts(
                        //     // imageUrl: popularItems[index].imageUrl,
                        //     // title: popularItems[index].title,
                        //     // description: popularItems[index].description,
                        //     // price: popularItems[index].price,
                        //   ),
                        // );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
