import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_app/models/ProductModel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:exchange_app/shapes/bg_shape.dart';

class AddProduct extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AddProduct> {
  TextEditingController _TitleController = TextEditingController();
  TextEditingController _TWController = TextEditingController();
  TextEditingController _DescController = TextEditingController();

  Product _prod = Product();
  String _CatController = 'Vehicles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(0),
            child: ListView(
              children: <Widget>[
                Stack(children: <Widget>[
                  bg_shape(),
                  Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                        child: Text(
                          "ADD PRODUCT",
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 140, 20, 20),
                        child: Text(
                          "Trading App",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  )
                ]),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: TextField(
                    controller: _TitleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Product Title',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: TextField(
                    controller: _TWController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Trade With...',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: DropdownButtonFormField<String>(
                    value: _CatController,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: const Color.fromARGB(255, 12, 242, 180)),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      labelText: 'Category',
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _CatController = newValue!;
                      });
                    },
                    items: <String>[
                      'Vehicles',
                      'Electronics',
                      'Furniture',
                      'Books',
                      'Fashion',
                      'Other'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: TextStyle(
                                inherit: false,
                                color:
                                    const Color.fromARGB(255, 12, 242, 180))),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                  child: TextFormField(
                    controller: _DescController,
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: ElevatedButton(
                      child: Text('ADD PRODUCT'),
                      onPressed: _addprod,
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(12, 242, 180, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                ),
              ],
            )));
  }

  void _addprod() async {
    _prod.title = _TitleController.text;
    _prod.tradeWith = _TWController.text;
    _prod.category = _CatController;
    _prod.description = _DescController.text;
    _prod.created = DateTime.now();

    String uid = FirebaseAuth.instance.currentUser!.uid;

    final docc =
        await FirebaseFirestore.instance.collection('All Products').doc();

    docc.set(_prod.toJson(uid, docc.id));

    _TitleController.text = '';
    _TWController.text = '';
    _CatController = '';
    _DescController.text = '';

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            content: Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Item Added successfully!',
                            style: TextStyle(
                              fontSize: 28,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color =
                                    const Color.fromARGB(255, 12, 242, 180),
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'Item Added successfully!',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text(
                            "Done",
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },

                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(12, 242, 180, 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),

                          //),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
