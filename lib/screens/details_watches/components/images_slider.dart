import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/watches.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({Key? key, required this.watches}) : super(key: key);

  Watches watches;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    List imageList = watches.imgPaths;

    return CarouselSlider.builder(
      itemCount: watches.imgPaths.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Image.asset(
            watches.imgPaths[itemIndex],
            fit: BoxFit.cover,
          ),
      options: CarouselOptions(height: 400.0),
    );
  }
}
