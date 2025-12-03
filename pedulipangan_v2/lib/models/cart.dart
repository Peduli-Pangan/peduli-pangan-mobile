import 'menu.dart';

class CartItems {
  final OrderableMealModel meal;
  final DateTime date;
  int quantity;

  CartItems({required this.meal, required this.date, this.quantity = 1});
}

class ShoppingCart {
  final List<CartItems> items = [];

  void addItem(OrderableMealModel meal, DateTime date) {
    bool found = false;
    for (var item in items) {
      if (item.meal == meal && item.date.isAtSameMomentAs(date)) {
        item.quantity++;
        found = true;
        break;
      }
    }
    if (!found) {
      items.add(CartItems(meal: meal, date: date));
    }
  }

  void decrementItem(CartItems item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      items.remove(item);
    }
  }

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
}

final ShoppingCart globalCart = ShoppingCart();
