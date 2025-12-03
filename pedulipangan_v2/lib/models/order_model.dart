class OrderModel {
  final int id;
  final DateTime createdAt;
  final String orderNumber;
  final String status;
  final double subtotal;
  final double total;
  final String note;
  final DateTime? updatedAt;
  final int userId;
  final int merchantId;
  final int alamatId;

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.orderNumber,
    required this.status,
    required this.subtotal,
    required this.total,
    required this.note,
    this.updatedAt,
    required this.userId,
    required this.merchantId,
    required this.alamatId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      orderNumber: json['order_number'],
      status: json['status'],
      subtotal: (json['subtotal'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
      note: json['note'],
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      userId: json['user_id'],
      merchantId: json['merchant_id'],
      alamatId: json['alamat_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'order_number': orderNumber,
      'status': status,
      'subtotal': subtotal,
      'total': total,
      'note': note,
      'updated_at': updatedAt?.toIso8601String(),
      'user_id': userId,
      'merchant_id': merchantId,
      'alamat_id': alamatId,
    };
  }
}
