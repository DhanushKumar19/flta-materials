import 'package:flutter/material.dart';

import 'grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final _groceryItem = <GroceryItem>[];

  List<GroceryItem> get groceryItem => List.unmodifiable(_groceryItem);

  void deleteItem(int index) {
    _groceryItem.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItem item) {
    _groceryItem.add(item);
    notifyListeners();
  }

  void updateItem(GroceryItem item, int index) {
    _groceryItem[index] = item;
    notifyListeners();
  }

  void completeItem(int index, bool change) {
    final item = _groceryItem[index];
    _groceryItem[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}