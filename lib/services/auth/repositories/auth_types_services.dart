abstract class LoginServiceRepo {
  Future<bool> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<bool> loginViaGoogle();
  Future<bool> isUserLoggedIn();
  // Future<void> loginViaFacebook();
  // Future<void> loginViaApple();
  Future<bool> logout();
}
