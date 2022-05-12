import 'package:exchange_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:exchange_app/shapes/bg_shape.dart';
import 'package:provider/provider.dart';

class signuppage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<signuppage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
      final name_controller = TextEditingController();
    final phone_controller = TextEditingController();
    final emailController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final passwordController = TextEditingController();
    validator() {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        print("Validated");
        authService.signup(emailController.text, passwordController.text,name_controller.text,phone_controller.text);
        Navigator.pushNamed(context, '/');
      } else {
        print("Not Validated");
      }
    }

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(0),
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
                            "REGISTER NOW!",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: TextFormField(
                        controller: name_controller,
                        validator:
                            ValidationBuilder().required().build(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          labelText: 'name',
                        ),
                      ),
                    ),

                     Container(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: TextFormField(
                        controller: phone_controller,
                        validator:
                            ValidationBuilder().phone().required().build(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          labelText: 'Phone',
                        ),
                      ),
                    ),

                     Container(
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: TextFormField(
                        controller: emailController,
                        validator:
                            ValidationBuilder().email().required().build(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: PasswordField(
                        labelText: 'Create Password',
                        controller: passwordController,
                        validate:
                            ValidationBuilder().required().minLength(7).build(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                      child: PasswordField(
                        labelText: 'Confirm Password',
                        controller: confirmPasswordController,
                        validate: (String? value) {
                          if (value == null || value.trim().length == 0) {
                            return "Field is required";
                          }
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            return "Password does not match";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                        child: ElevatedButton(
                          child: Text('Signup'),
                          onPressed: () {
                            validator();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(12, 242, 180, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        )),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text('Already have an account?'),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(12, 242, 180, 1),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    
                    
                  ],
                ))));
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.labelText,
    this.controller,
    this.validate,
  });

  final String? labelText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validate;
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      validator: widget.validate,
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
