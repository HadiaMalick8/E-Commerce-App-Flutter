
import 'package:flutter/material.dart';

import '../../../res/color_strings.dart';
import 'color_box.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Color'),
              Row(
                children: [
                  ColorBox(color: c1, isSelected: true),
                  ColorBox(
                    color: c2,
                  ),
                  ColorBox(
                    color: c3,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  color: Colors.grey[700]
              ),
              children: [
                TextSpan(
                  text: 'Size\n',
                ),
                TextSpan(
                  text: '12 cm',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}