import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utilities {
  static late Utilities utilities;
  static final Utilities instance = Utilities._instance();

  Utilities._instance() {
    utilities = instance;
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    int? seconds,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: seconds ?? 4),
      ),
    );
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool validPhoneNumber({required String phoneNumber}) {
    final numericRegex = RegExp(r'^[\d]+$');
    if (phoneNumber.length >= 10 && numericRegex.hasMatch(phoneNumber)) {
      return true;
    }
    return false;
  }

  static bool isValidPincode({required String pincode}) {
    final numericRegex = RegExp(r'^[\d]+$');
    if (pincode.length == 6 && numericRegex.hasMatch(pincode)) {
      return true;
    }
    return false;
  }
}
