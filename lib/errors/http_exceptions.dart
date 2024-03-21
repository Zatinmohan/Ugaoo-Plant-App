import 'package:ugaoo/errors/base_exception.dart';

class HttpExceptions extends BaseException {
  final int? statusCode;
  const HttpExceptions([
    super.message,
    this.statusCode,
  ]);

  factory HttpExceptions.fromCode({int? errorCode}) {
    switch (errorCode) {
      case 400:
        return const HttpExceptions("Error Code 400");

      case 401:
        return const HttpExceptions("Error code 401");

      case 500:
        return const HttpExceptions("Error code 500");

      default:
        return const HttpExceptions();
    }
  }
}
