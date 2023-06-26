import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/config/localization/localization_settings.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocaleNotifierController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      instance<AppSettingsSharedPreferences>();
  final languageList = LocaleSettings.languages;

  String get currentLanguage => _appSettingsSharedPreferences.locale;

  Future<void> changeLanguage({
    required BuildContext context,
    required String langCode,
  }) async {
    _appSettingsSharedPreferences.setLocale(langCode);
    await EasyLocalization.of(context)!.setLocale(Locale(langCode));
    Get.updateLocale(Locale(langCode));
    update();
  }
}
