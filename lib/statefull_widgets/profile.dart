import 'package:exchange_app/models/profileModel.dart';
import 'package:exchange_app/services/auth.dart';
import 'package:exchange_app/services/fire_store_services.dart';
import 'package:exchange_app/shapes/bg_shape_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

class profile extends StatefulWidget {
  profile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    //final firestoreService = Provider.of<firestore_database>(context);
    final user = FirebaseAuth.instance.currentUser;
    final name_cont = TextEditingController();
    final email_cont = TextEditingController();
    final phone_cont = TextEditingController();
    return FutureBuilder<profile_model?>(
        future: firestore_database(user!.uid).readUser(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final d = snapshot.data!;
            name_cont.text = d.Name;
            email_cont.text = d.email;
            phone_cont.text = d.Phone;
            return Stack(
              children: <Widget>[
                ListView(children: [
                  bg_shape_profile(),
                  Column(
                    children: [
                   
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        
                          child: CircularProfileAvatar(
                            '',
                            child: Container(
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  image: ExactAssetImage('assets/egypt.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: double.infinity,
                              height: 0,
                            ),
                            borderWidth: 3,
                            elevation: 10,
                            radius: 55,
                          ),
                       transform: Matrix4.translationValues(0.0, -70.0, 0.0),
                      ),   Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            d.Name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0),
                          ),
                        ),transform: Matrix4.translationValues(0.0, -250.0, 0.0),
                      ),
                 Container(
                       transform: Matrix4.translationValues(0.0, -100.0, 0.0),
                  child:    Form(
                          child: Column(children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            controller: name_cont,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.account_circle_outlined,
                                color: const Color.fromARGB(255, 12, 242, 180),
                              ),
                              labelText: d.Name,
                            ),
                          ),
                        ),
                        Container(child: Divider(color: Colors.black)),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            controller: phone_cont,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone_iphone,
                                color: const Color.fromARGB(255, 12, 242, 180),
                              ),
                              labelText: d.Phone,
                            ),
                          ),
                        ),
                        Container(child: Divider(color: Colors.black)),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: TextFormField(
                            controller: email_cont,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.mail_outline,
                                color: const Color.fromARGB(255, 12, 242, 180),
                              ),
                              labelText: d.email,
                            ),
                          ),
                        ),
                        Container(child: Divider(color: Colors.black)),
                        Row(
                          children: [
                            Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                                child: ElevatedButton(
                                  child: Text('Logout'),
                                  onPressed: () async {
                                    await authService.signout();
                                    Navigator.pushNamed(context, '/');
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(12, 242, 180, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                )),
                            Container(
                                height: 50,
                                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                                child: ElevatedButton(
                                  child: Text('Update'),
                                  onPressed: () async {
                                    try {
                                      await user.updateEmail(email_cont.text);
                                      firestore_database(user.uid)
                                          .createUserData(name_cont.text,
                                              phone_cont.text, email_cont.text);
                                      Navigator.pushNamed(context, '/home');
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(12, 242, 180, 1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                )),
                          ],
                        ),
                      ])),),
                    ],
                  ),
               
                ]),
              ],
            );
          }
        });
  }
}
