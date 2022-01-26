import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/consts/my_icons.dart';
import 'package:store/provider/dark_theme_provider.dart';
import 'package:store/screens/cart.dart';
import 'package:store/screens/wishlist.dart';
import 'package:store/services/global_method.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // bool _value = false;
  ScrollController _scrollController;
  final _auth = FirebaseAuth.instance;

  var top = 0.0;
  String _uid;
  String _name;
  String _email;
  String _joinedAt;
  String _phoneNumber;
  String _userImageUrl;

  @override
  void initState() {
    getData();
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  void getData() async {
    User user = _auth.currentUser;
    _uid = user.uid;
    if (user.isAnonymous) {
      setState(() {
        _joinedAt = user.metadata.toString();
      });
    } else {
      final userDoc =
          await FirebaseFirestore.instance.collection("users").doc(_uid).get();

      setState(() {
        _email = user.email;
        _joinedAt = userDoc.get("joinedAt");
        _phoneNumber =
            user.phoneNumber.toString(); // userDoc.get("phoneNumber");
        _name = user.displayName; // userDoc.get("name");
        _userImageUrl = userDoc.get("imageUrl");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_userImageUrl ??
                                          'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle(title: "User Bag")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                            leading: Icon(MyAppIcons.wishlist),
                            title: Text("Wishlist"),
                            trailing: Icon(Icons.chevron_right_rounded),
                            onTap: () => Navigator.of(context).pushNamed(
                                  WishlistScreen.routeName,
                                )),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                            leading: Icon(MyAppIcons.cart),
                            title: Text("Card"),
                            trailing: Icon(Icons.chevron_right_rounded),
                            onTap: () => Navigator.of(context).pushNamed(
                                  CartScreen.routeName,
                                )),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle(title: "User Information")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile(context, "Email", _email ?? "", 0, () {}),
                    userListTile(
                        context, "Phone number", _phoneNumber ?? "", 1, () {}),
                    userListTile(
                        context, "Shipping address", "subTitle", 2, () {}),
                    userListTile(
                        context, "joined date", _joinedAt ?? "", 3, () {}),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle(title: "User setting")),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Consumer<DarkThemeProvider>(
                      builder: (context, data, child) => listTileSwitch(
                        value: data.darkTheme,
                        title: "Dark theme",
                        icon: Ionicons.md_moon,
                        onPressed: () {
//TODO add SetState
                          data.darkTheme = !data.darkTheme;
                        },
                        onChange: (currentState) {
//TODO add SetState
                          data.darkTheme = currentState;
                        },
                      ),
                    ),
                    userListTile(context, "Logout", "", 4, () {
                      // Navigator.canPop(context)?Navigator.pop(context):Navigator.pop(context,false);
                      GlobalMethods.showDialogg(
                          "Warning", "Do you wanna logout", () async {
                        await _auth.signOut();
                      }, context);
                    }),
                  ],
                ),
              )
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget userTitle({String title}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }

  Widget listTileSwitch(
      {String title,
      IconData icon,
      Function onPressed,
      Function onChange,
      value}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPressed,
      trailing: Switch(
        value: value,
        onChanged: onChange,
      ),
    );
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
  ];

  Widget userListTile(BuildContext context, String title, String subTitle,
      int index, Function onPressed) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          leading: Icon(_userTileIcons[index]),
          title: Text(title),
          subtitle: Text(subTitle),
          onTap: onPressed,
        ),
      ),
    );
  }
}
