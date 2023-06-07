import 'package:acthub/config/constants.dart';
import 'package:acthub/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
      ConstantsPrefsKey.outBoardingViewedKey,
      true,
    );
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(
          ConstantsPrefsKey.outBoardingViewedKey,
        )
        .onNull();
  }

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.token, token);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKey.token).onNull();
  }

  Future<void> setEmail(String email) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.email, email);
  }

  String getEmail() {
    return _sharedPreferences.getString(ConstantsPrefsKey.email).onNull();
  }

  Future<void> setPassword(String password) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.password, password);
  }

  String getPassword() {
    return _sharedPreferences.getString(ConstantsPrefsKey.password).onNull();
  }

  Future<void> setLoggedIn() async {
    await _sharedPreferences.setBool(ConstantsPrefsKey.loggedIn, true);
  }

  bool loggedIn() {
    return _sharedPreferences.getBool(ConstantsPrefsKey.loggedIn).onNull();
  }

  void clear() {
    _sharedPreferences.clear();
  }
}
