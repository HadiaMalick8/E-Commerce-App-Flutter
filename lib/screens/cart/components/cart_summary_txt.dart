import 'package:flutter/material.dart';

class CartSummaryText extends StatelessWidget {
  const CartSummaryText({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = TextStyle(
      color: Colors.grey[900],
      fontWeight: title == 'TOTAL:' ? FontWeight.bold : FontWeight.normal,
    );

    final TextStyle priceTextStyle = TextStyle(
      color: Colors.grey[900],
      fontWeight: title == 'TOTAL:' ? FontWeight.bold : FontWeight.normal,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleTextStyle),
        Text('\$$price', style: priceTextStyle),
      ],
    );
  }
}