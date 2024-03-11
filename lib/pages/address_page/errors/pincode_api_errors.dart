import 'package:ugaoo/errors/base_exception.dart';

class PincodeExceptions extends BaseException {
  const PincodeExceptions([super.message]);

  factory PincodeExceptions.fromMessage({String? message}) {
    switch (message) {
      case "Error" || "ERROR" || "INVALID":
        return const PincodeExceptions("Invalid Pincode");

      default:
        return const PincodeExceptions();
    }
  }
}
