import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/bags.dart';
import '../../../models/cart.dart';
import '../../../providers/cart_provider.dart';
import 'cart_counter.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key, required this.cartItem}) : super(key: key);

  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItem.product.price * cartItem.quantity;
    Size size = MediaQuery.sizeOf(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(
          cartItem.product.imgPath,
          height: 250,
          width: size.width * 0.15,
          fit: BoxFit.contain,
        ),
        title: Text(cartItem.product.name),
        subtitle: Text('\$${totalPrice.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return CartCounter(
                  cartItem: cartItem,
                  onQuantityChange: (newQuantity) {
                    cartProvider.updateCartItemQuantity(cartItem, newQuantity);
                  },
                );
              },
            ),
            IconButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .removeProductFromCart(cartItem.product);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
