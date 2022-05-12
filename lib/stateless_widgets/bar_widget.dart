import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Text title;
  final AppBar appBar;

  /// you can add more fields that meet your needs

  const BaseAppBar(
      {Key? key,
      required this.backgroundColor,
      required this.title,
      required this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title,
      backgroundColor: backgroundColor,
      actions: [
        Ink(
          decoration: const ShapeDecoration(
            color: Colors.grey,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.person),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/viewProfile');
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

///
/// creates the circular avatar for the header
/// [CircleAvatar]
///

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text('Trading App'),
            actions: [
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  Navigator.pushNamed(context, '/viewProfile');
                },
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: 400,
                child: Center(
                  child: Text(
                    'Thias is a test',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.green,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
