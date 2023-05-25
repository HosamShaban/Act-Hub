import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/widgets/mainButton.dart';
import 'package:flutter/material.dart';

Widget circleButton({
  required void Function() onPressed,
  required IconData iconData,
}) {
  return mainButton(
    onPressed: onPressed,
    child: Icon(
      iconData,
      color: ManagerColors.iconColor,
    ),
    shapeBorder: const CircleBorder(),
    minWidth: ManagerWidth.w50,
    height: ManagerHeight.h50,
    color: ManagerColors.primaryColor,
  );
}
