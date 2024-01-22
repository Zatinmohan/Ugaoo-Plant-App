class LoginWithEmailPasswordErrors implements Exception {
  final String message;
  const LoginWithEmailPasswordErrors([
    this.message = 'An unknown exception occurred.',
  ]);

  factory LoginWithEmailPasswordErrors.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailPasswordErrors('Please enter a valid email');

      case 'user-disabled':
        return const LoginWithEmailPasswordErrors(
          'This user has been disabled. Please contact support',
        );

      case 'user-not-found':
        return const LoginWithEmailPasswordErrors(
          'Email or password is incorrect. Try again',
        );

      case 'wrong-password':
        return const LoginWithEmailPasswordErrors(
          'Incorrect Email or password. Try again',
        );

      default:
        return const LoginWithEmailPasswordErrors();
    }
  }
}
