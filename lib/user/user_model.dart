class UserModel {
  final String firstName;
  final String lastName;
  final String loginType;
  final String loginToken;
  final bool isLoginSuccessful;

  const UserModel({
    required this.firstName,
    required this.lastName,
    required this.loginType,
    required this.loginToken,
    required this.isLoginSuccessful,
  });
}
