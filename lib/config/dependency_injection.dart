import 'package:acthub/features/out_boarding/presentation%20/controller/out_boarding_controller.dart';
import 'package:acthub/features/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

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
