import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/cart_view_model.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 512,
                child: ListView.builder(
                  itemCount: viewModel.cart.length,
                  itemBuilder: (context, index) => CartItem(
                    dish: viewModel.cart[index],
                    count: viewModel.count(viewModel.cart[index]),
                    increase: (dish) => viewModel.addToCart(dish),
                    decrease: (dish) => viewModel.removeFromCart(dish),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Total: ${viewModel.sum} €',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
