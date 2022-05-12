import 'package:exchange_app/statefull_widgets/loginpage.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            body: loginpage(),
          ),
        ],
      ),
    );
  }
}
