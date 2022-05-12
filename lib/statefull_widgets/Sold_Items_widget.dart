import 'package:exchange_app/shapes/bg_shape3.dart';
import 'package:exchange_app/stateless_widgets/productCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:exchange_app/models/ProductModel.dart';

import 'nav_bar_widget.dart';

class SoldItems extends StatefulWidget {
  SoldItems({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SoldItemsState createState() => _SoldItemsState();
}

class _SoldItemsState extends State<SoldItems> {
  List<Object> _itemsList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getitemsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(children: <Widget>[
        bg_shape3(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 28,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'search For Item...',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 10, 50, 0),
                      child: Text('New Products',
                          style: TextStyle(
                            color: Color.fromARGB(255, 12, 242, 180),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 50, 10),
                      child: Text('Showing All Products',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ],
                ),
           
                Container(
                  height: 40,
                  margin: EdgeInsets.fromLTRB(80, 10, 0, 5),
                  child: IconButton(
                    icon: const Icon(Icons.sort),
                    color: Color.fromARGB(255, 12, 242, 180),
                    onPressed: () {
                      setState(() {
                        _itemsList = _itemsList.reversed.toList();
                      });
                    },
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    padding:
                        EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 5),
                    itemCount: _itemsList.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return ProductCard(_itemsList[index] as Product);
                    })),
            Container(
              margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
            ),
          ],
        ),
        nav_bar_widget(),
      ]),
    );
  }

  Future getitemsList() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    var data = await FirebaseFirestore.instance
        .collection('All Products')
        .where('User_id', isEqualTo: uid)
        .where('Sold', isEqualTo: 1)
        .get();
    //the .where is a condition 3shan ageb el ana 3ayzo mn database

    setState(() {
      _itemsList = List.from(data.docs.map((doc) => Product.fromSnapshot(doc)));
      print(_itemsList.length);
      print(uid);
    });
  }
}
