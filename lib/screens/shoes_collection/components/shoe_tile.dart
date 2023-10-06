import 'package:flutter/material.dart';

import '../../../models/shoes.dart';

class ShoeTile extends StatelessWidget {
  ShoeTile({
    Key? key,
    required this.shoes,
    required this.onTap,
    required this.onTapCart,
  }) : super(key: key);

  Shoes shoes;
  void Function()? onTapCart;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 25,bottom: 25, right: 25),
        width: width * 0.45,
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
                  shoes.imgPath,
                  width: width * 1,
                  height: height * 0.2,
                ),
              ),
            ),

            //Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(shoes.desc, style: TextStyle(color: Colors.grey[600]),),
            ),

            //Name , Price and Cart Button
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //Name
                      Text(
                        shoes.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //Price
                      Text(
                        '\$${shoes.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  //Add to cart Button
                  GestureDetector(
                    onTap: onTapCart,
                    child: Container(
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
