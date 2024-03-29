import 'dart:ui';

import 'package:acthub/config/constants.dart';
import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';

LocaleSettings localeSettings = LocaleSettings();

class LocaleSettings {
  final AppSettingsSharedPreferences _preferences;

  LocaleSettings() : _preferences = instance<AppSettingsSharedPreferences>();

  static const Map<String, String> languages = {
    Constants.arabicKey: Constants.arabic,
    Constants.englishKey: Constants.english
  };

  List<Locale> get supportedLocales =>
      languages.keys.map((e) => Locale(e)).toList();

  Locale get defaultLocale => Locale(_preferences.locale);
}
