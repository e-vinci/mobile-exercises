import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/dish.dart';

class CartViewModel extends ChangeNotifier {
  final _cart = <Dish, int>{};

  UnmodifiableListView<Dish> get cart => UnmodifiableListView(_cart.keys);

  int count(Dish dish) => _cart[dish] ?? 0;

  int get total {
    var total = 0;
    for (final entry in _cart.entries) {
      total += entry.value;
    }
    return total;
  }

  double get sum {
    var sum = 0.0;
    for (final entry in _cart.entries) {
      sum += entry.value * entry.key.price;
    }
    return sum;
  }

  void addToCart(Dish dish) {
    _cart[dish] = (_cart[dish] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(Dish dish) {
    if (!_cart.containsKey(dish)) {
      throw Exception("Can't remove a dish not present");
    }

    if (_cart[dish] == 1) {
      _cart.remove(dish);
    } else {
      _cart[dish] = _cart[dish]! - 1;
    }

    notifyListeners();
  }
}
