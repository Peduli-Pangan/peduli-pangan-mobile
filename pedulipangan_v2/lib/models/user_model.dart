class UserModel {
  final int id;
  final DateTime createdAt;
  final String nama;
  final String email;
  final String passwordHash;
  final String username;
  final String role;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  UserModel({
    required this.id,
    required this.createdAt,
    required this.nama,
    required this.email,
    required this.passwordHash,
    required this.username,
    required this.role,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      nama: json['nama'],
      email: json['email'],
      passwordHash: json['password_hash'],
      username: json['username'],
      role: json['role'],
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      deletedAt:
          json['deleted_at'] != null
              ? DateTime.parse(json['deleted_at'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'nama': nama,
      'email': email,
      'password_hash': passwordHash,
      'username': username,
      'role': role,
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }
}
