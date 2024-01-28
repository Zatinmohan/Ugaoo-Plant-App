import 'package:ugaoo/errors/base_exception.dart';

class SharedPreferenceException extends BaseException {
  const SharedPreferenceException([super.message]);

  factory SharedPreferenceException.fromCode({String? error}) {
    return const SharedPreferenceException();
  }
}
