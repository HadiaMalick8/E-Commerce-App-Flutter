import 'package:flutter/material.dart';

class SortOptionProvider extends ChangeNotifier {
  String _selectedSortOption = 'Default';

  String get selectedSortOption => _selectedSortOption;

  void setSortOption(String option) {
    _selectedSortOption = option;
    notifyListeners();
  }
}
