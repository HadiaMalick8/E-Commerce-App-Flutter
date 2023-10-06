import 'package:flutter/material.dart';

class FilterOptionProvider extends ChangeNotifier {
  String _selectedFilterOption = 'Default';

  String get selectedFilterOption => _selectedFilterOption;

  void setFilterOption(String option) {
    _selectedFilterOption = option;
    notifyListeners();
  }
}
