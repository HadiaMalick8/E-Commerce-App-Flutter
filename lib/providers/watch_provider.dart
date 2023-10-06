import 'package:flutter/material.dart';

import '../models/watches.dart';
import '../models/products.dart';

class WatchProvider with ChangeNotifier{

  List<Watches> watchesList = watches;

  void filterShoes(String query) {
    watchesList = watches.where((watch) => watch.name.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }

  void sortByLowToHighPrice() {
    watches.sort((a, b) => a.price.compareTo(b.price));
    notifyListeners();
  }

  void sortByHighToLowPrice() {
    watches.sort((a, b) => b.price.compareTo(a.price));
    notifyListeners();
  }

  void resetSorting() {
    watches.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }
}



List<Watches> watches = products.whereType<Watches>().toList();