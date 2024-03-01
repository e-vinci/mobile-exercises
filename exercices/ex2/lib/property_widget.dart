import 'package:flutter/material.dart';

import 'property.dart';

class PropertyWidget extends StatelessWidget {
  final Property property;

  const PropertyWidget({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final toSellOrRent = property.isToSell ? "To sell" : "To rent";
    final flatOrHouse = property.isFlat ? "flat" : "house";

    return ListTile(
      title: Text("$toSellOrRent: $flatOrHouse of ${property.area} m\u00b2"),
      subtitle: Text("${property.rooms} bedrooms - ${property.price} €"),
    );
  }
}
