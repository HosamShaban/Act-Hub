import 'package:acthub/config/constants.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/resources/manager_text_theme_dark.dart';
import 'package:flutter/material.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    primaryColor: ManagerColors.primaryColor,
    primaryColorDark: ManagerColors.primaryColorDark,

    // this for disabled button co8lors
    disabledColor: ManagerColors.descriptionColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: Constants.elevationAppBar,
      titleTextStyle: getBoldTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.primaryColor,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorDarK,
    ),

    textTheme: ManagerTextThemeDark(),
  );
}
