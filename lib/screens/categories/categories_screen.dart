import 'package:flutter/material.dart';

import 'popular_product.dart';
import 'swipe_cards.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Text('Explore Our Collections', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 40,),
            SwipeCategoriesCards(),
            SizedBox(height: 50,),
            PopularProduct(),
          ],
        ),
      ),
    );
  }
}

