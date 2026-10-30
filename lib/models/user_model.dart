
class UserModel {
  final String username;
  final String password;
  final String nama;

  UserModel ({
    required this.username,
    required this.password,
    required this.nama,
});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], password: json['password'], nama: json['nama']);
  }
}