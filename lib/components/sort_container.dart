import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bag_provider.dart';
import '../providers/sort_option_provider.dart';

class SortContainer extends StatelessWidget {
  const SortContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bagProvider = Provider.of<BagProvider>(context);
    final sortOptionProvider = Provider.of<SortOptionProvider>(context);

    return Container(
      width: 120,
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sort By:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PopupMenuButton<String>(
            surfaceTintColor: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            onSelected: (value) {
              if (value == 'Low to High Price') {
                bagProvider.sortByLowToHighPrice();
              } else if (value == 'High to Low Price') {
                bagProvider.sortByHighToLowPrice();
              } else if (value == 'Default') {
                bagProvider.resetSorting();
              }
              sortOptionProvider.setSortOption(value);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Low to High Price',
                  child: Text('Low to High Price'),
                ),
                const PopupMenuItem<String>(
                  value: 'High to Low Price',
                  child: Text('High to Low Price'),
                ),
                const PopupMenuItem<String>(
                  value: 'Default',
                  child: Text('Default'),
                ),
              ];
            },
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ],
      ),
    );
  }
}
