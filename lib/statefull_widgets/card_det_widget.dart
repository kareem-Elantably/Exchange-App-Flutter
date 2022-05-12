import 'package:exchange_app/models/offers.dart';
import 'package:flutter/material.dart';

class card_details extends StatefulWidget {
  final Offers myData;

  card_details(this.myData);

  @override
  _card_details createState() => _card_details();
}

class _card_details extends State<card_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: (Text(
              'item title',
              style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0),
            )),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(color: Colors.white),
          ),

          // Main Body

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text(widget.myData.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Oswald",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 30.0)),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Text(
                                widget.myData.Tradedwith,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, //Center Row contents vertically,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                                child: Text('color:',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Oswald",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 24.0)),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 60, 0, 0),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //color: widget.myData.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 0, top: 270, bottom: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.black,
                          width: 30.0,
                        ),
                        image: new DecorationImage(
                          image:
                              ExactAssetImage("assets/" + widget.myData.image),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      width: double.infinity,
                      height: 200,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
