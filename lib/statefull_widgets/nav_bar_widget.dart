import 'package:flutter/material.dart';
import 'package:exchange_app/shapes/navbar_shape.dart';

class nav_bar_widget extends StatefulWidget {
  @override
  _nav_bar_widget createState() => _nav_bar_widget();
}

class _nav_bar_widget extends State<nav_bar_widget> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 80,
            child: Stack(
              children: [
              
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: RPSCustomPainter(),
                ),
                Center(
                  heightFactor: 0.8,
                  child: FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 12, 242, 180),
                      child: Icon(Icons.add),
                      elevation: 0.1,
                      onPressed: () {
                        Navigator.pushNamed(context, '/addproducts');
                      }),
                ),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          color: currentIndex == 0
                              ? const Color.fromARGB(255, 12, 242, 180)
                              : Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                            Navigator.pushNamed(context, '/home');
                        },
                        splashColor: Colors.white,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.person,
                            color: currentIndex == 1
                                ? const Color.fromARGB(255, 12, 242, 180)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(1);
                            Navigator.pushNamed(context, '/profile');
                          }),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.shopping_basket,
                            color: currentIndex == 2
                                ? const Color.fromARGB(255, 12, 242, 180)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(2);
                             Navigator.pushNamed(context, '/items');
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: currentIndex == 3
                                ? const Color.fromARGB(255, 12, 242, 180)
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(3);
                            Navigator.pushNamed(context, '/offers_recieved');
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


/*
class nav_bar_widget extends StatefulWidget {
  const nav_bar_widget({Key? key}) : super(key: key);

  @override
  State<nav_bar_widget> createState() => _nav_bar_widget();
}

class _nav_bar_widget extends State<nav_bar_widget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushNamed(context, '/');
      } else if (_selectedIndex == 1) {
        Navigator.pushNamed(context, '/items');
      } else if (_selectedIndex == 2) {
        Navigator.pushNamed(context, '/offers');
      } else if (_selectedIndex == 3) {
        Navigator.pushNamed(context, '/addproducts');
      } else {
        Navigator.pushNamed(context, '/offers_recieved');
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_library_books_rounded),
          label: 'my items',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_library_books_outlined),
          label: 'my Offers',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: 'Add Item',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Offer Recieved',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
*/