/// This is an Exception Class that is only used to show error Messages
///
/// This can be used as a parent class and can be used to other things such
/// error codes and messages
///
/// currently shows error messages as [message]

class BaseException implements Exception {
  final String message;

  const BaseException([
    this.message = "An unknown exception occurred. Please Try again",
  ]);
}
