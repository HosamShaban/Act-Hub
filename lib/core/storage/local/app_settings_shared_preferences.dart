import 'package:acthub/config/constants.dart';
import 'package:acthub/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsSharedPreferences {
  final SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences(this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
        ConstantsPrefsKey.outBoardingViewedKey, true);
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(ConstantsPrefsKey.outBoardingViewedKey)
        .onNull();
  }

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.tokenKey, token);
  }

  String getToken() {
    return _sharedPreferences.getString(ConstantsPrefsKey.tokenKey).onNull();
  }

  void clear() {
    _sharedPreferences.clear();
  }
}
