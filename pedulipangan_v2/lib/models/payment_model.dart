class PaymentModel {
  final int id;
  final DateTime createdAt;
  final double paidAmount;
  final String method;
  final String status;
  final String providerRef;
  final DateTime? paidAt;
  final int orderId;

  PaymentModel({
    required this.id,
    required this.createdAt,
    required this.paidAmount,
    required this.method,
    required this.status,
    required this.providerRef,
    this.paidAt,
    required this.orderId,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      paidAmount:
          (json['paid_ammount'] as num)
              .toDouble(), // Note: Typo in ERD 'paid_ammount' preserved
      method: json['method'],
      status: json['status'],
      providerRef: json['provider_ref'],
      paidAt: json['paid_at'] != null ? DateTime.parse(json['paid_at']) : null,
      orderId: json['order_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'paid_ammount': paidAmount,
      'method': method,
      'status': status,
      'provider_ref': providerRef,
      'paid_at': paidAt?.toIso8601String(),
      'order_id': orderId,
    };
  }
}
