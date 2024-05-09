class User {

  final int client_id;
  final String firstName;
  final String lastName;
  final String email;
  final String token;

  User({
    required this.client_id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'client_id': client_id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      client_id: json['client_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      token: json['token'],
    );
  }

}