class ProductModel {
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String nama;
  final String slug;
  final int harga;
  final int stock;
  final String condition;
  final String shortDesc;
  final String longDesc;
  final Map<String, dynamic>? attributes;
  final double rating;
  final bool isActive;
  final int merchantId;
  final int categoryId;
  final String tag;
  final DateTime? pickupWindow;

  ProductModel({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.nama,
    required this.slug,
    required this.harga,
    required this.stock,
    required this.condition,
    required this.shortDesc,
    required this.longDesc,
    this.attributes,
    required this.rating,
    required this.isActive,
    required this.merchantId,
    required this.categoryId,
    required this.tag,
    this.pickupWindow,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      nama: json['nama'],
      slug: json['slug'],
      harga: json['harga'],
      stock: json['stock'],
      condition: json['condition'],
      shortDesc: json['short_desc'],
      longDesc: json['long_desc'],
      attributes: json['attributes'],
      rating: (json['rating'] as num).toDouble(),
      isActive: json['is_active'],
      merchantId: json['merchant_id'],
      categoryId: json['category_id'],
      tag: json['tag'],
      pickupWindow:
          json['pickupWindow'] != null
              ? DateTime.parse(json['pickupWindow'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'nama': nama,
      'slug': slug,
      'harga': harga,
      'stock': stock,
      'condition': condition,
      'short_desc': shortDesc,
      'long_desc': longDesc,
      'attributes': attributes,
      'rating': rating,
      'is_active': isActive,
      'merchant_id': merchantId,
      'category_id': categoryId,
      'tag': tag,
      'pickupWindow': pickupWindow?.toIso8601String(),
    };
  }
}
