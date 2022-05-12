import 'package:exchange_app/models/ProductModel.dart';
import 'package:exchange_app/statefull_widgets/offer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class offerCard extends StatelessWidget {
  final Product _offer;
  offerCard(this._offer);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => offer(_offer)),
          );
        },
        child: Container(
          child: Column(
            children: [
              Container(child: Divider(color: Colors.black)),
              ListTile(
                title: Text(
                  "${_offer.title}",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "${DateFormat('MM/dd/yyyy').format(_offer.created!).toString()}" +
                      "\n${_offer.description}",
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
}
