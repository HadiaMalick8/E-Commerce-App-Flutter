import 'dart:ui';

import 'products.dart';

class Watches extends Product {
  final String watchType;
  final List<String> imgPaths;

  Watches({
    required int id,
    required String name,
    required double price,
    required String desc,
    required String imgPath,
    required Color color,
    required this.watchType,
    required this.imgPaths,
  }) : super(
    id: id,
    name: name,
    price: price,
    desc: desc,
    imgPath: imgPath,
    color: color,
  );
}