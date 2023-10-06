import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/my_button.dart';
import '../../models/cart.dart';
import '../checkout/checkout_screen.dart';
import 'components/cart_item.dart';
import '../../providers/cart_provider.dart';
import 'components/cart_summary_txt.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {

      final double shippingPrice = value.cartItems.isEmpty ? 0 : 10;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  CartSummaryText(
                    title: 'Sub Total:',
                    price: value.calculateSubTotal(),
                  ),
                  CartSummaryText(
                    title: 'Shipping:',
                    price: shippingPrice,
                  ),
                  CartSummaryText(
                      title: 'TOTAL:', price: value.calculateTotalAmount()+shippingPrice),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                itemBuilder: (context, index) {
                  Cart cartItem = value.cartItems[index];

                  return CartItemWidget(cartItem: cartItem);
                },
              ),
            ),
            MyButton(
              onTap: () {
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CheckOutScreen(cartProvider: cartProvider),
                  ),
                );
              },
              btnText: 'Check Out',
              screenName: 'Cart',
            ),
          ],
        ),
      );
    });
  }
}
