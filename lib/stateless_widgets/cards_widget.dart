import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exchange_app/services/auth.dart';
import 'package:exchange_app/statefull_widgets/all_products_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:exchange_app/models/ProductModel.dart';
import 'package:provider/provider.dart';

class CardSquare extends StatefulWidget {
  CardSquare({
    Key? key,
  }) : super(key: key);

  @override
  _CardSquare createState() => _CardSquare();
}

class _CardSquare extends State<CardSquare> {
  List<Object> _itemsList = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getitemsList();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<Auth>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/trade1.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                width: double.infinity,
                height: 200,
              ),
            ),
          ),
          Expanded(
              child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                      child: InkWell(
                        onTap: () async{
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Vehicles',
                                  )));
                              //await authService.signout();
                                //           Navigator.pushNamed(context, '/');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.motorcycle,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Vehicle',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Electronics',
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_iphone,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Electronics',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Furniture',
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chair,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Furniture ',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Books',
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Books',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Fashion',
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Fashion',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AllItems(
                                    title: 'Other',
                                  )));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 50.0,
                            ),
                            Text(
                              'Other',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.black,
                                decorationStyle: TextDecorationStyle.solid,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 12, 242, 180),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
          ),
        ],
      ),
    );
  }

  Future getitemsList() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    var data =
        await FirebaseFirestore.instance.collection('All Products').get();
    setState(() {
      _itemsList = List.from(data.docs.map((doc) => Product.fromSnapshot(doc)));
      print(_itemsList.length);
      print(uid);
    });
  }
}
