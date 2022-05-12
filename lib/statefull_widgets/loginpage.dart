import 'package:exchange_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:exchange_app/shapes/bg_shape.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';

class loginpage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    validator() {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        print("Validated");

        authService.login(emailController.text, passwordController.text);
        Navigator.pushNamed(context, '/');
      } else {
        print("Not Validated");
      }
    }

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(0.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage('assets/trade2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: 180,
                        height: 125,
                      ),
                    ),
                  ),
                  Stack(children: <Widget>[
                    bg_shape(),
                    Center(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                          child: Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 30,
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
                  Center(
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Text(
                          "LOGIN!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                    child: PasswordField(
                      labelText: 'Password *',
                      controller: passwordController,
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                      child: ElevatedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          await validator();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(12, 242, 180, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      )),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      TextButton(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(12, 242, 180, 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  ),
                ],
              ),
            )));
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.labelText,
    this.controller,
  });

  final String? labelText;

  final TextEditingController? controller;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      validator: ValidationBuilder().required().build(),
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        filled: true,
        labelText: widget.labelText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
