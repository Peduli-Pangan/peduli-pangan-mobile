import 'restaurant.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final double originalPrice; // For strikethrough if needed, or just display price
  final int quantityLeft;
  final String pickupTimeStart;
  final String pickupTimeEnd;
  final double distance; // in meters or km
  final Restaurant restaurant;
  final String description;
  final bool isSurplus;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.originalPrice = 0,
    required this.quantityLeft,
    required this.pickupTimeStart,
    required this.pickupTimeEnd,
    required this.distance,
    required this.restaurant,
    required this.description,
    this.isSurplus = true,
  });
}

// Dummy Data
final List<Product> dummyProducts = [
  Product(
    name: "Donat Kentang",
    imageUrl: "assets/img/donat.png", // Placeholder
    price: 10000,
    quantityLeft: 3,
    pickupTimeStart: "18:00",
    pickupTimeEnd: "20:00 WIB",
    distance: 800,
    restaurant: dummyRestaurant,
    description: "Varian donat yang lembut dan empuk karena terbuat dari campuran tepung terigu dan kentang, memberikan tekstur yang ringan namun tetap padat. Dengan rasa yang manis dan topping yang beragam.",
    isSurplus: true,
  ),
  Product(
    name: "Hot Dog",
    imageUrl: "assets/img/hotdog.png", // Placeholder
    price: 10000,
    quantityLeft: 3,
    pickupTimeStart: "18:00",
    pickupTimeEnd: "20:00 WIB",
    distance: 800,
    restaurant: dummyRestaurant,
    description: "Hot dog lezat dengan sosis premium.",
    isSurplus: true,
  ),
];
