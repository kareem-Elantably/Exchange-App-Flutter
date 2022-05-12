import 'package:exchange_app/statefull_widgets/nav_bar_widget.dart';
import 'package:exchange_app/stateless_widgets/cards_widget.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
          
            extendBodyBehindAppBar: true,
            body: CardSquare(),
          ),
          nav_bar_widget(),
        ],
      ),
    );
  }
}
