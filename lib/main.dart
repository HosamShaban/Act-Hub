import 'package:acthub/config/constants.dart';
import 'package:acthub/core/service/theme_service.dart';
import 'package:acthub/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;

  MyApp({super.key}) : _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(
        Constants.deviceWidth,
        Constants.deviceHeight,
      ),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.splashView,
          theme: _themeService.getThemeData(),
          themeMode: _themeService.getThemeMode(),
        );
      },
    );
  }
}
