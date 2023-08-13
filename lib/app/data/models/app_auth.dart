class AppAuth {
  AppAuth({
    required this.mail,
    required this.password,
  });

  final String mail;
  final String password;

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "password": password,
      };
}
