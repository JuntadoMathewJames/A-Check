class User {
  String id;
  final String email;
  final int password;
  final DateTime usrType;
  User(
      {this.id = '',
      required this.email,
      required this.password,
      required this.usrType});

  Map<String, dynamic> toJson() =>
      {'id': id, 'email': email, 'password': password, 'user_type': usrType};
}
