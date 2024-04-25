import 'package:flutter/material.dart';

import '../models/dish.dart';

class CartItem extends StatelessWidget {
  final Dish dish;
  final int count;
  final void Function(Dish) increase;
  final void Function(Dish) decrease;

  const CartItem({
    super.key,
    required this.dish,
    required this.count,
    required this.increase,
    required this.decrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListTile(
                title: Text(dish.name),
                subtitle: Text(
                  'Unit price: ${dish.price} €\n'
                  'Quantity: $count\n'
                  'Total price: ${count * dish.price} €',
                ),
                isThreeLine: true,
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () => increase(dish),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => decrease(dish),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
