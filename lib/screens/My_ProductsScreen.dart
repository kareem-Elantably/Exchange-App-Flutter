import 'package:flutter/material.dart';
import 'package:exchange_app/statefull_widgets/My_Items_widget.dart';

class My_Products_Screen extends StatelessWidget {
  const My_Products_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Products',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MyItems(
            title: 'Products',
          ),
        ],
      ),
    );
  }
}
