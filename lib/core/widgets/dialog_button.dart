import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:flutter/material.dart';

Widget dialogButton({void Function()? onPressed, String? message}) {
  return mainButton(
    child: Text(
      ManagerString.ok,
      style: getMediumTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.white,
      ),
    ),
    onPressed: onPressed,
    color: ManagerColors.primaryColor,
    height: ManagerHeight.h40,
  );
}
