import 'package:exchange_app/statefull_widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:exchange_app/models/offers.dart';






//not needed screen










class offers_recieved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
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
                "Offers Recived",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: getOffers(context),
          ),nav_bar_widget(),
        ],
      ),
    
    );
  }

  getOffers(BuildContext context) {
    return ListView.builder(
      itemCount: allOffers.length,
      itemBuilder: _getItem,
      padding: EdgeInsets.all(0.0),
    );
  }

  // First Attempt
  Widget _getItem(BuildContext context, int index) {
    return Card(
        child: Row(
      children: [
        Image.asset(
          "assets/" + allOffers[index].image,
          fit: BoxFit.cover,
          height: 100,
          width: 100.0,
        ),
        Column(
          children: <Widget>[
            Text(
              allOffers[index].name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            Text('Traded with: ${allOffers[index].Tradedwith}',
                style:
                    TextStyle(fontSize: 11.0, fontWeight: FontWeight.normal)),
          ],
        ),
        Column(
          children: [
            ButtonBar(children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/offersCompare');
                    },
                    child: Text("View Offer"),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 20), primary: Colors.amber),
                  ),
                ),
              ]),
            ])
          ],
        )
      ],
    ));
  }
}
