// lib/models/menu.dart
class OrderableMealModel {
  final String type;
  final String description;
  final String? imageUrl;
  final bool isSelected;
  final double price;
  final String restaurantName;
  final String restaurantAddress;
  final String restaurantLogoUrl;
  final List<String> tags;
  final String pickupTime;
  final int stock;

  OrderableMealModel({
    required this.type,
    required this.description,
    this.imageUrl,
    this.isSelected = false,
    this.price = 15000,
    this.restaurantName = "Peduli Pangan Kitchen",
    this.restaurantAddress = "Jl. Peduli No. 1, Jakarta",
    this.restaurantLogoUrl = "https://via.placeholder.com/50",
    this.tags = const ["Surplus Food"],
    this.pickupTime = "18:00 - 20:00 WIB",
    this.stock = 5,
  });

  OrderableMealModel copyWith({bool? isSelected}) {
    return OrderableMealModel(
      type: type,
      description: description,
      imageUrl: imageUrl,
      isSelected: isSelected ?? this.isSelected,
      price: price,
      restaurantName: restaurantName,
      restaurantAddress: restaurantAddress,
      restaurantLogoUrl: restaurantLogoUrl,
      tags: tags,
      pickupTime: pickupTime,
      stock: stock,
    );
  }
}

class DailyMenu {
  final DateTime date;
  final String dayName;
  final OrderableMealModel? lunchOption;
  final OrderableMealModel? dinnerOption;

  DailyMenu({
    required this.date,
    required this.dayName,
    this.lunchOption,
    this.dinnerOption,
  });

  DailyMenu copyWith({
    OrderableMealModel? lunchOption,
    OrderableMealModel? dinnerOption,
  }) {
    return DailyMenu(
      date: date,
      dayName: dayName,
      lunchOption: lunchOption ?? this.lunchOption,
      dinnerOption: dinnerOption ?? this.dinnerOption,
    );
  }
}

// Data Dummy untuk Menu Katering (Berdasarkan Screenshot)
final List<DailyMenu> dummyMenuData = [
  DailyMenu(
    date: DateTime(2025, 10, 20),
    dayName: "Monday, 20 October 2025",
    lunchOption: OrderableMealModel(
      type: 'Lunch',
      description:
          "Ayam Bumbu Hitam Madura with Nasi Tutug Oncom + FREE Tempe Goreng Bawang",
      imageUrl:
          "https://images.unsplash.com/photo-1626082927389-e1c7190eeaf0?auto=format&fit=crop&w=800&q=80",
      price: 25000.0,
      restaurantName: "Dapur Bu Dewi",
      restaurantAddress: "Jl. Kebon Jeruk No. 12, Jakarta Barat",
      restaurantLogoUrl:
          "https://ui-avatars.com/api/?name=Dapur+Bu+Dewi&background=random",
      tags: ["Surplus Food", "Halal"],
      pickupTime: "11:00 - 13:00 WIB",
      stock: 10,
    ),
    dinnerOption: OrderableMealModel(
      type: "Dinner",
      description: "Mie Kari Susu Ikan + FREE Vegetables Springroll",
      imageUrl:
          "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=800&q=80",
      price: 22000.0,
      restaurantName: "Noodle House 88",
      restaurantAddress: "Jl. Tebet Raya No. 45, Jakarta Selatan",
      restaurantLogoUrl:
          "https://ui-avatars.com/api/?name=Noodle+House&background=random",
      tags: ["Surplus Food"],
      pickupTime: "18:00 - 20:00 WIB",
      stock: 8,
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 21),
    dayName: "Tuesday, 21 October 2025",
    lunchOption: OrderableMealModel(
      type: 'Lunch',
      description:
          "Bubble Crumb Nugget Ranch Sauce with Rose Penne + FREE Truffle Mushroom Soup",
      imageUrl:
          "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?auto=format&fit=crop&w=800&q=80",
      price: 30000.0,
      restaurantName: "Western Corner",
      restaurantAddress: "Mall Taman Anggrek Lt. 3, Jakarta Barat",
      restaurantLogoUrl:
          "https://ui-avatars.com/api/?name=Western+Corner&background=random",
      tags: ["Surplus Food", "Western"],
      pickupTime: "11:00 - 13:00 WIB",
      stock: 5,
    ),
    dinnerOption: OrderableMealModel(
      type: "Dinner",
      description: "Sate Abang Senayan with Nasi Kuning + FREE Tahu Cabe Garam",
      imageUrl:
          "https://images.unsplash.com/photo-1555126634-323283e090fa?auto=format&fit=crop&w=800&q=80",
      price: 28000.0,
      restaurantName: "Sate Khas Senayan",
      restaurantAddress: "Jl. Pakubuwono No. 10, Jakarta Selatan",
      restaurantLogoUrl:
          "https://ui-avatars.com/api/?name=Sate+Senayan&background=random",
      tags: ["Surplus Food", "Indonesian"],
      pickupTime: "18:00 - 20:00 WIB",
      stock: 12,
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 22),
    dayName: "Wednesday, 22 October 2025",
    lunchOption: OrderableMealModel(
      type: 'Lunch',
      description: "Lunch menu for Wednesday is coming soon...",
      imageUrl:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80",
      price: 0.0,
      restaurantName: "Coming Soon",
      restaurantAddress: "-",
      restaurantLogoUrl: "",
      tags: [],
      pickupTime: "-",
      stock: 0,
    ),
    dinnerOption: OrderableMealModel(
      type: "Dinner",
      description: "Dinner menu for Wednesday is coming soon...",
      imageUrl:
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80",
      price: 0.0,
      restaurantName: "Coming Soon",
      restaurantAddress: "-",
      restaurantLogoUrl: "",
      tags: [],
      pickupTime: "-",
      stock: 0,
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 23),
    dayName: "Thursday, 23 October 2025",
    lunchOption: null,
    dinnerOption: OrderableMealModel(
      type: "Dinner",
      description: "Ayam Bakar Taliwang with Lalapan",
      imageUrl:
          "https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?auto=format&fit=crop&w=800&q=80",
      price: 27000.0,
      restaurantName: "Lombok Ijo",
      restaurantAddress: "Jl. Merdeka No. 5, Jakarta Pusat",
      restaurantLogoUrl:
          "https://ui-avatars.com/api/?name=Lombok+Ijo&background=random",
      tags: ["Surplus Food", "Spicy"],
      pickupTime: "18:00 - 20:00 WIB",
      stock: 7,
    ),
  ),
];
