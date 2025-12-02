class CategoryModel {
  final int id;
  final DateTime createdAt;
  final String nama;
  final String slug;

  CategoryModel({
    required this.id,
    required this.createdAt,
    required this.nama,
    required this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      nama: json['nama'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'nama': nama,
      'slug': slug,
    };
  }
}
