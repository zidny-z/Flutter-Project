class User {
  int userId;
  String name;
  String email;
  String bpjs;
  String role;
  String token;
  String renewalToken;

  User(
      {required this.userId,
      required this.name,
      required this.email,
      required this.bpjs,
      required this.role,
      required this.token,
      required this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        bpjs: responseData['bpjs'],
        role: responseData['role'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }
}
