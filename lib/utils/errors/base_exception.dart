class BaseException implements Exception {
  final String message;
  
  const BaseException([
    this.message = "An unknown exception occurred. Please Try again",
  ]);
}
