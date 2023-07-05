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

  String get locale => _sharedPreferences.getString('locale').parseToLocale();

  Future<void> setLocale(String locale) async {
    await _sharedPreferences.setString(ConstantsPrefsKey.locale, locale);
  }

  Future<void> setAppTheme(String theme) async {
    await _sharedPreferences.setString(Constants.prefKeyTheme, theme);
  }

  String getAppTheme() {
    return _sharedPreferences.getString(Constants.prefKeyTheme).toString();
  }

  void setUserName(String name) async {
    await _sharedPreferences.setString(Constants.username, name);
  }

  String getUserName() {
    return _sharedPreferences.getString(Constants.username).onNull();
  }

  void setUserPhone(String phone) async {
    await _sharedPreferences.setString(Constants.phone, phone);
  }

  String getUserPhone() {
    return _sharedPreferences.getString(Constants.phone).onNull();
  }

  Future<void> setHasProfileData() async {
    await _sharedPreferences.setBool(Constants.hasProfileData, true);
  }

  bool getHasProfileData() {
    return _sharedPreferences.getBool(Constants.hasProfileData).onNull();
  }
}
