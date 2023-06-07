import 'package:acthub/core/resources/manager_string.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class FailedValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ManagerString.invalidEmail;
    }

    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return ManagerString.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return ManagerString.invalidEmail;
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerString.invalidPassword;
    }

    if (password.length < 8) {
      return ManagerString.invalidPassword;
    }

    return null;
  }

  String? validateFullName(String? fullName) {
    if (fullName!.isEmpty) {
      return ManagerString.requiredPhone;
    }

    return null;
  }

  String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return ManagerString.requiredPhone;
    }

    if (!GetUtils.isPhoneNumber(phone)) {
      return ManagerString.invalidEmail;
    }

    return null;
  }
}
