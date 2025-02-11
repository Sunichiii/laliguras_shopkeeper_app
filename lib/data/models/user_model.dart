class UserModel {
  final String accessToken;
  final String refreshToken;
  final int userId;

  UserModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['data']['accessToken'],
      refreshToken: json['data']['refreshToken'],
      userId: json['data']['userId'],
    );
  }
}
