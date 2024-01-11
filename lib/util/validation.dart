import 'package:bowerbird_miniapp/util/utility.dart';

class Validation {
  static String? validateEmpty(
      {required String? value, String fieldName = "field"}) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    } else if (!Util.validateEmail(email)) {
      return "Email is invalid.";
    } else {
      return null;
    }
  }
}
