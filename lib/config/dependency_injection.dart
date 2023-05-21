import 'package:acthub/features/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

finishSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  finishSplash();
}
