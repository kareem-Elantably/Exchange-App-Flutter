import 'package:flutter/material.dart';


class Item {
  final String image , title,description;
  final int id;
  final Color color;
  final bool sold;


  Item(
    this.id,
    this.color,
    this.description,
    this.image,

    this.title,
    this.sold,
  );
}


List<Item> items = [
  Item(1,const Color(0xFF3D82AE), 'this is a test on description', 'assets/car.jpg', 'item1',true),
  Item(2,const Color(0xFF3D82AE), 'this is a test on description this is a test on description this is a test on description this is a test on descriptionthis is a test on description', 'assets/fan.jpg', 'item2',true),
  Item(3,const Color(0xFF3D82AE), 'great', 'assets/guitar.png', 'item3',false),
  Item(4,const Color(0xFF3D82AE), 'great', 'assets/laptop.jpg', 'item2',true),
  Item(5,const Color(0xFF3D82AE), 'great', 'assets/tv.jpg', 'item3',false),
  Item(6,const Color(0xFF3D82AE), 'great', 'assets/egypt.png','item4',false),
  Item(7,const Color(0xFF3D82AE), 'great', 'assets/shoes.png', 'item4',false),
];