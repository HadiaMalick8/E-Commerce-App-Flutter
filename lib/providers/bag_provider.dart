import 'package:flutter/material.dart';

import '../models/bags.dart';
import '../models/products.dart';

class BagProvider with ChangeNotifier {

  List<Bags> bagsList = bags;

  void filterBags(String query) {
    bagsList = bags.where((bag) => bag.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }

  void sortByLowToHighPrice() {
    bags.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void sortByHighToLowPrice() {
    bags.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void resetSorting() {
    bags.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  void filterBagsByType(String bagType) {
    if (bagType == 'All') {
      bagsList = bags;
    } else {
      bagsList = bags.where((bag) => bag.bagType.toLowerCase() == bagType.toLowerCase()).toList();
    }
    notifyListeners();
  }

  //
  // void filterProductsByType(String productType) {
  //   if (productType == 'All') {
  //     productsList = productsList;
  //   } else {
  //     productsList = productsList.where((product) {
  //       if (product is Bags) {
  //         return product.bagType.toLowerCase() == productType.toLowerCase();
  //       } else if (product is Shoes) {
  //         // Handle shoe type filtering
  //       } else if (product is Watches) {
  //         // Handle watch type filtering
  //       }
  //       return false;
  //     }).toList();
  //   }
  //   notifyListeners();
  // }
}

List<Bags> bags = products.whereType<Bags>().toList();
