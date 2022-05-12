import 'package:exchange_app/statefull_widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:exchange_app/statefull_widgets/My_Offers_widget.dart';

class My_Offerss_Screen extends StatelessWidget {
  const My_Offerss_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
            appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
        titleSpacing: 0,
        title: new Text(
         'My Offers',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
   
      ),
      extendBodyBehindAppBar: true,
      body:Stack(children: [ MyOffers(
        title: 'My Offers',
      ), nav_bar_widget(),],)
      
  
    );
  }
}
