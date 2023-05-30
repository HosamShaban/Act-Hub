import 'package:acthub/core/internet_checker/internet_checker.dart';
import 'package:acthub/core/network/app_api.dart';
import 'package:acthub/core/network/dio_factory.dart';
import 'package:acthub/core/storage/local/app_settings_shared_preferences.dart';
import 'package:acthub/features/out_boarding/presentation%20/controller/out_boarding_controller.dart';
import 'package:acthub/features/splash/presentation/controller/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppApi>(() => AppApi(dio));

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}
