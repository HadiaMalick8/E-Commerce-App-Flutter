import 'package:flutter/material.dart';
import 'package:shop_app/models/bags.dart';

class BagsTile extends StatelessWidget {
  BagsTile({
    super.key,
    required this.bags,
    required this.onTapCart,
    required this.onTap,
  });

  Bags bags;
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
              padding: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  bags.imgPath,
                  width: width * 1,
                  height: height * 0.2,
                ),
              ),
            ),

            //Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(bags.desc, style: TextStyle(color: Colors.grey[600]),),
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
                        bags.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //Price
                      Text(
                        '\$${bags.price}',
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
