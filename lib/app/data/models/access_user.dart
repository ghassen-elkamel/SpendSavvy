class AccessUser {
  AccessUser({
    this.accessToken,
    this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  factory AccessUser.fromJson(Map<String, dynamic>? json) {
    try {
      if (json != null) {}
    } catch (_) {}

    return AccessUser(
      accessToken: json?["accessToken"],
      refreshToken: json?["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        if (accessToken != null) "accessToken": accessToken,
        if (refreshToken != null) "refreshToken": refreshToken,
      };
}
