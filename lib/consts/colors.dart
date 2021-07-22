
import 'package:flutter/material.dart';

class ColorsConsts {

  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);

  static Color title = Color(0xDD000000);
  static Color subTitle = Color(0x8A000000);
  static Color backgroundColor = Color(0xFFE0E0E0); //grey shade 300

  static Color favColor = Color(0xFFF44336); // red 500
  static Color favBadgeColor = Color(0xFFE57373); // red 300

  static Color cartColor = Color(0xFF5E35B1); //deep purple 600
  static Color cartBadgeColor = Color(0xFFBA68C8); //purple 300

  static Color gradiendFStart = Color(0xFFE040FB); //purpleaccent 100
  static Color gradiendFEnd = Color(0xFFE1BEE7); //purple 100
  static Color endColor = Colors.blue..withOpacity(0.1);//Color(0xFFCE93D8); //purple 200

  static Color purple300 = Color(0xFFBA68C8); //purple 300
  static Color gradiendLEnd = Color(0xFF80B6FF); //purple 400
  static Color  gradiendLStart = Color(0xFF006DFF); //purpleaccent 700

  static Color starterColor = Colors.lightBlue ;//Color(0xFF8E24AA); //purple 600
  static Color purple800 = Color(0xFF6A1B9A);
}

//    CustomScrollView(
//             controller: _scrollController,
//             slivers: <Widget>[
//               SliverAppBar(
//                 automaticallyImplyLeading: false,
//                 elevation: 4,
//                 expandedHeight: 200,
//                 pinned: true,
//                 flexibleSpace: LayoutBuilder(
//                     builder: (BuildContext context, BoxConstraints constraints) {
//                   top = constraints.biggest.height;
//                   return Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                           colors: [
//                             ColorsConsts.starterColor,
//                             ColorsConsts.endColor,
//                           ],
//                           begin: const FractionalOffset(0.0, 0.0),
//                           end: const FractionalOffset(1.0, 0.0),
//                           stops: [0.0, 1.0],
//                           tileMode: TileMode.clamp),
//                     ),
//                     child: FlexibleSpaceBar(
//                       collapseMode: CollapseMode.parallax,
//                       centerTitle: true,
//                       title: Row(
//                         //  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           AnimatedOpacity(
//                             duration: Duration(milliseconds: 300),
//                             opacity: top <= 110.0 ? 1.0 : 0,
//                             child: Row(
//                               children: [
//                                 SizedBox(
//                                   width: 12,
//                                 ),
//                                 Container(
//                                   height: kToolbarHeight / 1.8,
//                                   width: kToolbarHeight / 1.8,
//                                   decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.white,
//                                         blurRadius: 1.0,
//                                       ),
//                                     ],
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       fit: BoxFit.fill,
//                                       image: NetworkImage(
//                                           'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 12,
//                                 ),
//                                 Text(
//                                   // 'top.toString()',
//                                   'Guest',
//                                   style: TextStyle(
//                                       fontSize: 20.0, color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       background: Image(
//                         image: NetworkImage(
//                             'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//               SliverToBoxAdapter(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.only(left: 8.0),
//                         child: userTitle('User Information')),
//                     Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Email', 'Email sub', 0, context),
//                     userListTile('Phone number', '4555', 0, context),
//                     userListTile('Shipping address', '', 0, context),
//                     userListTile('joined date', 'date', 0, context),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: userTitle('User settings'),
//                     ),
//                     Divider(
//                       thickness: 1,
//                       color: Colors.grey,
//                     ),
//                     ListTileSwitch(
//                       value: _value,
//                       leading: Icon(Ionicons.md_moon),
//                       onChanged: (value) {
//                         setState(() {
//                           _value = value;
//                         });
//                       },
//                       visualDensity: VisualDensity.comfortable,
//                       switchType: SwitchType.cupertino,
//                       switchActiveColor: Colors.indigo,
//                       title: Text('Dark theme'),
//                     ),
//                     userListTile('Logout', '', 4, context),
//                   ],
//                 ),
//               )
//             ],
//           ),
