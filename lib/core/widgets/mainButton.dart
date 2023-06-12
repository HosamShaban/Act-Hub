import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:flutter/material.dart';

Widget mainButton(
    {required Widget child,
    void Function()? onPressed,
    ShapeBorder? shapeBorder,
    Color? color,
    double? minWidth,
    double? height,
    EdgeInsetsGeometry? padding,
    double? elevation}) {
  return MaterialButton(
    padding: padding,
    onPressed: onPressed ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
    color: color.onNull(),
    minWidth: minWidth.onNull(),
    height: height.onNull(),
    elevation: elevation.onNull(),
    child: child,
  );
}
