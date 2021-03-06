import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:giki_eats/services/database.dart';
import 'package:giki_eats/utils/colors.dart';
import 'package:giki_eats/utils/loader.dart';
import 'package:giki_eats/utils/variables.dart';

class AddMenu extends StatefulWidget {
  AddMenu({Key key}) : super(key: key);

  @override
  _AddMenu createState() => _AddMenu();
}

class _AddMenu extends State<AddMenu> {
  String titleText = 'Menu';

  @override
  Widget build(BuildContext context) {
    DatabaseService _db = new DatabaseService(restaurantId: restaurant.id);
    return Scaffold(
      backgroundColor: white,
      body: StreamBuilder(
          stream: _db.getDeactivatedMenuItems,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              menu = snapshot.data;
              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 150,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            "Add Menu",
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
                    color: white,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Color.fromRGBO(0, 105, 92, 1),
                    //     Color.fromRGBO(0, 135, 121, 1),
                    //     Color.fromRGBO(81, 184, 160, 1),
                    //     Color.fromRGBO(178, 224, 187, 1),
                    //     Color.fromRGBO(253, 244, 179, 1),
                    //   ],
                    // ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      for (var menuItem in menu)
                        Stack(
                          children: <Widget>[
                            //main box
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 8, 24, 8),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(0, 3),
                                      blurRadius: 7,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //main foodItem
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(100, 30, 18, 0),
                              child: Container(
                                child: Text(
                                  '${menuItem.name}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: teal,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),

                            //price
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(100, 60, 70, 18),
                              child: Container(
                                child: Text(
                                  'Rs: ${menuItem.price}',
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
                              padding: const EdgeInsets.fromLTRB(5, 18, 0, 18),
                              child: Container(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: teal,
                                  child: CircleAvatar(
                                    radius: 38,
                                    backgroundImage: NetworkImage(
                                      menuItem.image,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //rightSide Icons
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 18, 10, 0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  height: 80,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Icon(
                                            Icons.add,
                                            color: teal,
                                          ),
                                          onTap: () {
                                            print(
                                                '${menuItem.name} is activated...');
                                            _db.activateMenuItem(menuItem.id);
                                          },
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        GestureDetector(
                                          child: Icon(
                                            Icons.delete,
                                            size: 22,
                                            color: teal,
                                          ),
                                          onTap: () {
                                            _db.deleteMenuItem(menuItem.id);
                                          },
                                        ),
                                      ],
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
              );
            } else {
              return Loading();
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        backgroundColor: teal,
        onPressed: () {
          Navigator.pushNamed(context, '/createMenu');
        },
      ),
    );
  }
}
