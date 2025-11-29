class OrderHistoryItem {
  final String invoice;
  final String orderDescription;
  final DateTime orderDate;
  final double totalAmount;
  final String status;
  final String reg;

  OrderHistoryItem({
    required this.invoice,
    required this.orderDescription,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.reg,
  });
}