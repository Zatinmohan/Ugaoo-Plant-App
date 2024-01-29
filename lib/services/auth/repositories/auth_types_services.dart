abstract class LoginServiceRepo {
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> loginViaGoogle();
  // Future<void> loginViaFacebook();
  // Future<void> loginViaApple();
  Future<void> logout();
}