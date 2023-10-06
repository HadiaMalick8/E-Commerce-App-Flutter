import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bag_provider.dart';
import '../providers/filter_option_provider.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final bagProvider = Provider.of<BagProvider>(context);
    final filterOptionProvider = Provider.of<FilterOptionProvider>(context);

    return Container(
      width: 120,
      height: 50,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Filter:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PopupMenuButton<String>(
            surfaceTintColor: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            onSelected: (value) {
              if (value == 'Hand Bag') {
                bagProvider.filterBagsByType(value);
              } else if (value == 'Clutch') {
                bagProvider.filterBagsByType(value);
              } else if (value == 'Handle Bag') {
                bagProvider.filterBagsByType(value);
              } else if (value == 'Laptop Bag') {
                bagProvider.filterBagsByType(value);
              } else if (value == 'All') {
                bagProvider.filterBagsByType(value);
              }
              filterOptionProvider.setFilterOption(value);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Hand Bag',
                  child: Text('Hand Bags'),
                ),
                const PopupMenuItem<String>(
                  value: 'Clutch',
                  child: Text('Clutches'),
                ),
                const PopupMenuItem<String>(
                  value: 'Handle Bag',
                  child: Text('Handle Bags'),
                ),
                const PopupMenuItem<String>(
                  value: 'Laptop Bag',
                  child: Text('Laptop Bags'),
                ),
                const PopupMenuItem<String>(
                  value: 'All',
                  child: Text('All'),
                ),
              ];
            },
            child: const Icon(Icons.filter_list_alt),
          ),
        ],
      ),
    );
  }
}