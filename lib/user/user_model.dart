class UserModel {
  final String? _firstName;
  final String? _lastName;
  final String? _loginType;
  final String? _loginToken;
  final bool? _isLoginSuccessful;
  final String? _userEmail;
  final String? _profileImage;

  const UserModel({
    String? firstName,
    String? lastName,
    String? loginType,
    String? loginToken,
    bool? isLoginSuccessful,
    String? userEmail,
    String? profileImage,
  })  : _firstName = firstName,
        _lastName = lastName,
        _loginToken = loginToken,
        _isLoginSuccessful = isLoginSuccessful,
        _loginType = loginType,
        _userEmail = userEmail,
        _profileImage = profileImage;

  String get userName => (_firstName ?? "") + (_lastName ?? "");
  String get loginType => _loginType ?? "";
  String get loginToken => _loginToken ?? "";
  String get userEmail => _userEmail ?? "";
  bool get isLoginSuccessful => _isLoginSuccessful ?? false;
  String get profileImage => _profileImage ?? "";
}
