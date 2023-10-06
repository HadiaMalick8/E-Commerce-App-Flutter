import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2.5, right: 12.5),
      padding: const EdgeInsets.all(2),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? color : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}