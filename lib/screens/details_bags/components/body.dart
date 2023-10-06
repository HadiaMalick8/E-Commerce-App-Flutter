import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/my_button.dart';
import '../../../models/bags.dart';
import '../../../providers/cart_provider.dart';
import 'bag_title_with_image.dart';
import 'color_and_size.dart';
import 'description.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    Key? key,
    required this.product,
  }) : super(key: key);

  final product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 25,
                    right: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      const ColorAndSize(),
                      Description(product: product),
                      MyButton(
                        btnText: 'Add to Cart',
                        screenName: 'Details',
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProductToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to cart!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                BagTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

