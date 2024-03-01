class Property {
  final bool isToSell;
  final bool isFlat;
  final int area;
  final int rooms;
  final double price;

  const Property({
    required this.isToSell,
    required this.isFlat,
    required this.area,
    required this.rooms,
    required this.price,
  });
}

const propertiesToSell = [
  Property(isToSell: true, isFlat: true, area: 123, rooms: 2, price: 300000),
  Property(isToSell: true, isFlat: false, area: 234, rooms: 4, price: 500000),
];

const propertiesToRent = [
  Property(isToSell: false, isFlat: true, area: 123, rooms: 2, price: 1000),
  Property(isToSell: false, isFlat: false, area: 234, rooms: 4, price: 1500),
];
