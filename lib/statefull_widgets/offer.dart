import 'package:flutter/material.dart';
import 'package:exchange_app/models/ProductModel.dart';
import 'package:exchange_app/shapes/bg_shape2.dart';
import 'package:exchange_app/statefull_widgets/nav_bar_widget.dart';
import 'nav_bar_widget.dart';

class offer extends StatefulWidget {
  final Product myData;

  offer(this.myData);

  @override
  _offer createState() => _offer();
}

class _offer extends State<offer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: new AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
              ),
              titleSpacing: 0,
              title: new Text(
                "Offer Details",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            extendBodyBehindAppBar: true,
        body:Stack(children: [
        Padding(
            padding: EdgeInsets.all(0),
            child: ListView(
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                   // padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
                    child:  bg_shape2(),),
                 
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              child: Text("${widget.myData.title}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/egypt.png",
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                Container(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(40, 0, 0, 20),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Text('+200 EGP',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text('By: mahmoud'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 270, 20, 20),
                    child: Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xffffffff),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.black),
                          child: Icon(
                            Icons.autorenew_rounded,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 330, 20, 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              child: Text("${widget.myData.title}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: ClipRRect(
                                    child: Image.asset(
                                      "assets/egypt.png",
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                Container(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(40, 0, 0, 20),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Text('+200 EGP',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text('By: You'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: ElevatedButton(
                      child: Text('ACCEPT'),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/'); // Nehot route el home page
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 12, 242, 180),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: ElevatedButton(
                      child: Text('REJECT'),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/'); // Nehot route el home page
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 0, 0, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )),Container(
                          margin: EdgeInsets.only(bottom: 100),
                        ),
              ],
            )), 
            nav_bar_widget(),],), 
            );
  }
}
