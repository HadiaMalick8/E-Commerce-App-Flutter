import 'package:flutter/material.dart';

import '../../../models/bags.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.product,
  });

  final product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Text(
        product.desc,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}