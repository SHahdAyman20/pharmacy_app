class UserData {
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}