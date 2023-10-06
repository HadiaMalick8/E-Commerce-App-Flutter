import 'dart:ui';

import 'products.dart';

class Shoes extends Product {
  final String shoeType;

  Shoes({
    required int id,
    required String name,
    required double price,
    required String desc,
    required String imgPath,
    required Color color,
    required this.shoeType,
  }) : super(
    id: id,
    name: name,
    price: price,
    desc: desc,
    imgPath: imgPath,
    color: color,
  );
}