import 'package:flutter/material.dart';

class BagTitleWithImage extends StatelessWidget {
  const BagTitleWithImage({
    super.key,
    required this.product,
  });

  final product;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aristocratic Product',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            product.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          //SizedBox(height: 25,),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: 'Price\n',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text: '\$${product.price}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Image.asset(
                    product.imgPath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
