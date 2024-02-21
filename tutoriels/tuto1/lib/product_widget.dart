import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 500,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "iPhone 15 Pro Max",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "1479 €",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                        "Aliquam et risus vel ipsum faucibus ultrices. "
                        "Fusce nec leo nisi. Vestibulum vehicula, "
                        "orci ac varius eleifend, ante erat efficitur tortor, "
                        "quis tincidunt elit ex ut est.",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image.asset('images/iphone.jpg', width: 150),
          ],
        ),
      ),
    );
  }
}
