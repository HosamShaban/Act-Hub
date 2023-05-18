import 'package:acthub/core/resources/manager_colors.dart';
import 'package:flutter/material.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
  );
}