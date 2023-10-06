import 'package:flutter/material.dart';

import '../../../models/cart.dart';

class CartCounter extends StatelessWidget {
  final Cart cartItem;
  final Function(int) onQuantityChange;

  const CartCounter({
    super.key,
    required this.cartItem,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          Icons.remove,
          () {
            if (cartItem.quantity > 1) {
              onQuantityChange(cartItem.quantity - 1);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            cartItem.quantity.toString().padLeft(2, '0'),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        buildOutlineButton(
          Icons.add,
          () {
            onQuantityChange(cartItem.quantity + 1);
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton(IconData icon, VoidCallback press) {
    return SizedBox(
      width: 20,
      height: 22,
      child: OutlinedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            ),
          ),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.grey[700],
          size: 12,
        ),
      ),
    );
  }
}
