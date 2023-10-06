import 'package:flutter/material.dart';

import '../models/products.dart';
import '../models/shoes.dart';

class ShoeProvider with ChangeNotifier{

  List<Shoes> shoesList = shoes;

  void filterShoes(String query) {
    shoesList = shoes.where((shoe) => shoe.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }

  void sortByLowToHighPrice() {
    shoes.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void sortByHighToLowPrice() {
    shoes.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void resetSorting() {
    shoes.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  // void filterShoesByType(String bagType) {
  //   if (bagType == 'All') {
  //     bagsList = bags;
  //   } else {
  //     bagsList = bags.where((bag) => bag.bagType.toLowerCase() == bagType.toLowerCase()).toList();
  //   }
  //   notifyListeners();
  // }
}

List<Shoes> shoes = products.whereType<Shoes>().toList();