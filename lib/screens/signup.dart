
import 'package:exchange_app/statefull_widgets/signuppage.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            body: signuppage(),
          ),
        ],
      ),
     
    );
  }
}
