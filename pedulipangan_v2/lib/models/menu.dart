// lib/models/menu.dart
class OrderableMeal {
  final String type;
  final String description;
  final String? imageUrl;
  final bool isSelected;

  OrderableMeal({
    required this.type,
    required this.description,
    this.imageUrl,
    this.isSelected = false,
  });

  OrderableMeal copyWith({bool? isSelected}) {
    return OrderableMeal(
      type: type,
      description: description,
      imageUrl: imageUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class DailyMenu {
  final DateTime date;
  final String dayName;
  final OrderableMeal? lunchOption;
  final OrderableMeal? dinnerOption;

  DailyMenu({
    required this.date,
    required this.dayName,
    this.lunchOption,
    this.dinnerOption,
  });

  DailyMenu copyWith({
    OrderableMeal? lunchOption,
    OrderableMeal? dinnerOption,
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
    lunchOption: OrderableMeal(
      type: 'Lunch',
      description:
          "Ayam Bumbu Hitam Madura with Nasi Tutug Oncom + FREE Tempe Goreng Bawang",
      imageUrl: "",
    ),
    dinnerOption: OrderableMeal(
      type: "Dinner",
      description: "Mie Kari Susu Ikan + FREE Vegetables Springroll",
      imageUrl: "",
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 21),
    dayName: "Tuesday, 21 October 2025",
    lunchOption: OrderableMeal(
      type: 'Lunch',
      description:
          "Bubble Crumb Nugget Ranch Sauce with Rose Penne + FREE Truffle Mushroom Soup",
      imageUrl: "",
    ),
    dinnerOption: OrderableMeal(
      type: "Dinner",
      description: "Sate Abang Senayan with Nasi Kuning + FREE Tahu Cabe Garam",
      imageUrl: "",
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 22),
    dayName: "Wednesday, 22 October 2025",
    lunchOption: OrderableMeal(
      type: 'Lunch',
      description: "Lunch menu for Wednesday is coming soon...",
      imageUrl: "",
    ),
    dinnerOption: OrderableMeal(
      type: "Dinner",
      description: "Dinner menu for Wednesday is coming soon...",
      imageUrl: "",
    ),
  ),
  DailyMenu(
    date: DateTime(2025, 10, 23),
    dayName: "Thursday, 23 October 2025",
    lunchOption: null,
    dinnerOption: OrderableMeal(
      type: "Dinner",
      description: "Ayam Bakar Taliwang with Lalapan",
      imageUrl: "",
    ),
  ),
];
