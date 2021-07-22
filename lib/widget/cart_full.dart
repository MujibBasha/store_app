import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store/consts/colors.dart';
import 'package:store/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {


  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange=Provider.of<DarkThemeProvider>(context);
    return Container(
        height:140,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
    color: Theme.of(context).backgroundColor,

        borderRadius:const  BorderRadius.only(topRight: Radius.circular(16.0),
        bottomRight: const Radius.circular(16.0),),
      ),
      child:Row(
        children:[
          Container(
            width: 130,
            decoration: BoxDecoration(
              image:DecorationImage(
                image:  AssetImage("assets/images/user_Image.jpg"),
                fit: BoxFit.fill,
              )
            ),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children:[
                      Flexible(
                        child: Text("title ",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
                          maxLines:1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                     Material(
                       color: Colors.transparent,
                       child: InkWell(
                         borderRadius: BorderRadius.only(topRight: Radius.circular(16),),
                         onTap: (){},
                         child:Container(
                             height:40,
                             width: 40,
                             child: Icon(Entypo.cross,color: Colors.red,size: 22,)),

                       ),
                     )
                     // IconButton(onPressed: (){}, icon: Icon(Icons.delete),splashColor: Colors.green,),

                    ]
                  ),
                  Row(
                    children: [
                      Text("Price:"),
                      SizedBox(width: 5,),
                      Text("450\$",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sub Total:"),
                      SizedBox(width: 5,),
                      Text("450\$",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).accentColor ),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5,),
                      Text("ships Free",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:themeChange.darkTheme?Colors.brown.shade900:Theme.of(context).accentColor ),),
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: (){},
                          child:Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.minus,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 12,
                        child:Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorsConsts.gradiendLStart,
                                ColorsConsts.gradiendLEnd,
                              ],
                              stops: [
                                0.0,
                                0.85,
                              ]
                            ),
                          ),
                          width: MediaQuery.of(context).size.width*0.12,
                          padding: const EdgeInsets.all(8.0),
                          child: Text("12",textAlign: TextAlign.center,),

                        )



                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: (){},
                          child:Container(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Entypo.plus,
                                color: Colors.green,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}
