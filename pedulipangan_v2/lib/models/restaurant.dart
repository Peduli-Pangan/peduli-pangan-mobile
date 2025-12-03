class Restaurant {
  final String name;
  final String address;
  final double rating;
  final String imageUrl;
  final double latitude;
  final double longitude;

  Restaurant({
    required this.name,
    required this.address,
    required this.rating,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });
}

// Dummy Data
final Restaurant dummyRestaurant = Restaurant(
  name: "JCO",
  address: "Tunjungan Plaza, Jl. Embong Malang No.6 Lantai 4",
  rating: 4.8,
  imageUrl: "assets/img/jco_logo.png", // Placeholder
  latitude: -7.2629,
  longitude: 112.7414,
);
