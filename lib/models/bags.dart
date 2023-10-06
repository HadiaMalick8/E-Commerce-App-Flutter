import 'dart:ui';

import 'products.dart';

class Bags extends Product {
  final String bagType;

  Bags({
    required int id,
    required String name,
    required double price,
    required String desc,
    required String imgPath,
    required Color color,
    required this.bagType,
  }) : super(
    id: id,
    name: name,
    price: price,
    desc: desc,
    imgPath: imgPath,
    color: color,
  );
}
