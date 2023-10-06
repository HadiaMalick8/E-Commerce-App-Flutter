import 'dart:ui';

import '../res/image_strings.dart';
import 'bags.dart';
import 'shoes.dart';
import 'watches.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String desc;
  final String imgPath;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.desc,
    required this.imgPath,
    required this.color,
  });
}

List<Product> _products = [

  /* Bags List */
  Bags(
    id: 1,
    name: 'Blue Bag',
    price: 120,
    desc: demoDescription,
    bagType: 'Hand Bag',
    imgPath: imgBag1,
    color: const Color(0xFF3D82AE),
  ),
  Bags(
    id: 2,
    name: 'Leather Bag',
    price: 110,
    desc: demoDescription,
    bagType: 'Clutch',
    imgPath: imgBag2,
    color: const Color(0xFFD3A984),
  ),
  Bags(
    id: 3,
    name: 'Black Bag',
    price: 100,
    desc: demoDescription,
    bagType: 'Hand Bag',
    imgPath: imgBag3,
    color: const Color(0xFF989493),
  ),
  Bags(
    id: 4,
    name: 'Peach Bag',
    price: 120,
    desc: demoDescription,
    bagType: 'Hand Bag',
    imgPath: imgBag4,
    color: const Color(0xFFE6B398),
  ),
  Bags(
    id: 5,
    name: 'Pink Bag',
    price: 130,
    desc: demoDescription,
    bagType: 'Handle Bag',
    imgPath: imgBag5,
    color: const Color(0xFFFB7883),
  ),
  Bags(
    id: 6,
    name: 'Black Laptop Bag',
    price: 150,
    desc: demoDescription,
    bagType: 'Laptop Bag',
    imgPath: imgBag6,
    color: const Color(0xFFAEAEAE),
  ),

  /* Shoes List */
  Shoes(
    id: 1,
    name: 'Running Shoes',
    price: 80,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe1,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 2,
    name: 'Running Shoes',
    price: 180,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe2,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 3,
    name: 'Nike Invincible 3',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe3,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 4,
    name: 'Running Shoes',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe4,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 5,
    name: 'Running Shoes',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe5,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 6,
    name: 'Running Shoes',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe6,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 7,
    name: 'Running Shoes',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe7,
    color: const Color(0xFF2D2D2D),
  ),
  Shoes(
    id: 8,
    name: 'Running Shoes',
    price: 90,
    desc: 'Comfortable running shoes for your active lifestyle.',
    shoeType: 'Running Shoes',
    imgPath: imgShoe8,
    color: const Color(0xFF2D2D2D),
  ),


  /* Watches List */
  Watches(
    id: 1,
    name: 'Classic Watch',
    price: 200,
    desc: 'A classic timepiece that never goes out of style.',
    watchType: 'Analog Watch',
    imgPath: imgWatch1,
    imgPaths: [
      imgWatch1,
      imgWatch2Of1,
      imgWatch3Of1,
    ],
    color: const Color(0xFF2D2D2D),
  ),
  Watches(
    id: 2,
    name: 'Classic Watch',
    price: 200,
    desc: 'A classic timepiece that never goes out of style.',
    watchType: 'Analog Watch',
    imgPath: imgWatch2,
    imgPaths: [
      imgWatch2,
      imgWatch2Of2,
      imgWatch3Of2,
    ],
    color: const Color(0xFF2D2D2D),
  ),


];

List<Product> get products => _products;

String demoDescription = 'Upgrading your wardrobe calls for a pop of color – like this must-have pink hand bag! It is the best way to make a statement.';
