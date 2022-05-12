import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_app/models/OffersModel.dart';
import 'package:exchange_app/models/ProductModel.dart';
import 'package:exchange_app/statefull_widgets/Product_Description_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class sending_offer extends StatefulWidget {
  @override
  _State createState() => _State();
  final Product _product;
  final Product recieved;
  Offer newOffer = Offer();
  sending_offer(this._product, this.recieved);
}

class _State extends State<sending_offer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _addOffer,
        child: Container(
          child: Column(
            children: [
              Container(child: Divider(color: Colors.black)),
              ListTile(
                title: Text(
                  "${widget._product.title}",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "${DateFormat('MM/dd/yyyy').format(widget._product.created!).toString()}" +
                      "${widget._product.description}",
                  maxLines: 4,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                hoverColor: Colors.blue,
                leading: Container(
                  padding:
                      EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/car.jpg",
                    fit: BoxFit.cover,
                    width: 100.0,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _addOffer() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    widget.newOffer.Creator = widget.recieved.user_id;
    widget.newOffer.ProductIDOriginal = widget.recieved.product_id;
    widget.newOffer.uidMadeOffer = uid;
    widget.newOffer.OfferedID = widget._product.product_id;

    final docc = await FirebaseFirestore.instance.collection('Offers').doc();

    docc.set(widget.newOffer.toJson());

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
                            'Offer Sent successfully!',
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
                            'Offer Sent successfully!',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Product_Description(widget.recieved)),
                            );
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
