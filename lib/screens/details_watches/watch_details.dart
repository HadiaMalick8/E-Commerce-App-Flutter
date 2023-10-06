import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/my_appbar.dart';

import '../../components/my_button.dart';
import '../../models/watches.dart';
import '../../providers/cart_provider.dart';
import '../details_bags/components/description.dart';
import 'components/images_slider.dart';
import 'components/watch_images.dart';

class WatchesDetails extends StatelessWidget {
  WatchesDetails({Key? key, required this.watches}) : super(key: key);

  Watches watches;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Column(
        children: [
          MyAppBar(),
          ImagesSlider(watches: watches),
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      watches.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${watches.price}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Description(product: watches),
                MyButton(
                  btnText: 'Add to Cart',
                  screenName: 'Details',
                  onTap: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addProductToCart(watches);
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
          )
        ],
      ),
    );
  }
}
