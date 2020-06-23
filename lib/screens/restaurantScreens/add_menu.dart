import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:giki_eats/models/order.dart';
import 'package:giki_eats/models/menu_item.dart';
import 'package:giki_eats/services/database.dart';
import 'package:giki_eats/utils/colors.dart';
import 'package:giki_eats/utils/loader.dart';
import 'package:giki_eats/utils/variables.dart';

class AddMenu extends StatefulWidget {

  AddMenu({Key key}) : super(key : key);

  @override
  _AddMenu createState() => _AddMenu();
}

class _AddMenu extends State<AddMenu> {

  String titleText = 'Menu';

  @override
  Widget build(BuildContext context) {
    DatabaseService _db = new DatabaseService(restaurantId: restaurant.id);
    return Scaffold(
      body: StreamBuilder(
          stream: _db.menu,
          builder: (context, snapshot){
            if(snapshot.hasData){
              menu = snapshot.data;
              print('Menu: ${menu[0].toJson()}');
              return NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 150,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text("Add Menu",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          background: Image.asset(
                            "images/menucover.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ];
                },
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 105, 92, 1),
                          Color.fromRGBO(0, 135, 121, 1),
                          Color.fromRGBO(81, 184, 160, 1),
                          Color.fromRGBO(178, 224, 187, 1),
                          Color.fromRGBO(253, 244, 179, 1),
                        ],
                      )
                  ),
                  child: ListView(
                    children: <Widget>[
                      for(int i=0; i<menu.length; i++)
                        Stack(
                          children: <Widget>[

                            //main box
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30,8,24,8),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),

                            //main foodItem
                            Padding(
                              padding: const EdgeInsets.fromLTRB(18,30,18,0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '${menu[i].name}',
                                  style: TextStyle(
                                    fontSize: 22  ,
                                    fontWeight: FontWeight.w500,
                                    color: teal,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),

                            //price
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,60,70,18),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Rs: ${menu[i].price}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: teal,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),

                            //foodItem Image
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5,18,0,18),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0,3),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.asset(
                                    "images/fast_food.png",
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),

                            //rightSide Ioons
                            Padding(
                              padding: const EdgeInsets.fromLTRB(320,18,5,18),
                              child: Container(
                                height: 80,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: Offset(0,3),
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.add,
                                    color: teal,
                                  ),
                                  onTap: () {
                                    print('Add Item..');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );

            } else {
              return Loading();
            }
          }
      ),
    );
  }
}