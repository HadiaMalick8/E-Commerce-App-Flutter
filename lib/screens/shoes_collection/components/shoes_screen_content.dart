import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/filter_container.dart';
import '../../../components/sort_container.dart';
import '../../../models/shoes.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/shoe_provider.dart';
import '../../../res/text_strings.dart';
import '../../details_bags/product_details.dart';
import 'shoe_tile.dart';

class ShoesScreenContent extends StatelessWidget {
  const ShoesScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);
    final shoeProvider = Provider.of<ShoeProvider>(context);

    void addBagToCart(Shoes shoes) {
      cartProvider.addProductToCart(shoes);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added to cart!'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
                child: TextField(
                  onChanged: (query) {
                    shoeProvider.filterShoes(query);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: txtSearch,
                    suffixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),

              // Sort By and Filter
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Sort
                  SortContainer(),

                  // Filter
                  FilterContainer(),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              if (index == 0) {
                // The first item in the list, show "Women Bags" heading
                return const Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: Text(
                    titleShoeScreen,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                );
              } else {
                // Other items in the list, display bags
                Shoes shoes = shoeProvider.shoesList[index - 1];
                return ShoeTile(
                  shoes: shoes,
                  onTapCart: () => addBagToCart(shoes),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: shoes,))
                    );
                  },
                );
              }
            },
            childCount: shoeProvider.shoesList.length + 1,
          ),
        ),
      ],
    );
  }
}
