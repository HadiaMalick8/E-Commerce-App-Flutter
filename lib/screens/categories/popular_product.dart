import 'package:flutter/material.dart';

import '../../res/image_strings.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      const Text(
        'Popular Product',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 10,),
      Container(
        margin: const EdgeInsets.only(bottom: 25, right: 25),
        //width: size.width * 0.45,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Product Image
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imgShoe3,
                  width: size.width * 1,
                  height: size.height * 0.2,
                ),
              ),
            ),

            //Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                'Comfortable running shoes for your active lifestyle.',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            //Name , Price and Cart Button
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name
                      Text(
                        'Nike Invincible 3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //Price
                      Text(
                        '\$90',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  //Add to cart Button
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
