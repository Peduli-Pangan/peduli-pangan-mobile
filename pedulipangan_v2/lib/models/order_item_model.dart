class OrderItemModel {
  final int id;
  final DateTime createdAt;
  final String namaProduct;
  final double hargaProduct;
  final int jumlah;
  final double subtotal;
  final int productId;

  OrderItemModel({
    required this.id,
    required this.createdAt,
    required this.namaProduct,
    required this.hargaProduct,
    required this.jumlah,
    required this.subtotal,
    required this.productId,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      namaProduct: json['nama_product'],
      hargaProduct: (json['harga_product'] as num).toDouble(),
      jumlah: json['jumlah'],
      subtotal: (json['subtotal'] as num).toDouble(),
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'nama_product': namaProduct,
      'harga_product': hargaProduct,
      'jumlah': jumlah,
      'subtotal': subtotal,
      'product_id': productId,
    };
  }
}
