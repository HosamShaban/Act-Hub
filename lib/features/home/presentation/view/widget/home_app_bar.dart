import 'package:acthub/core/resources/manager_assets.dart';
import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar homeAppBar() {
  return AppBar(
    title: Text(
      ManagerString.actHub,
      style: getRegularTextStyle(
        fontSize: ManagerFontSize.s22,
        color: ManagerColors.primaryColor,
      ),
    ),
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          ManagerAssets.search,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          ManagerAssets.notification,
        ),
      )
    ],
  );
}
