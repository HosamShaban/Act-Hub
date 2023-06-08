import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:flutter/material.dart';

Checkbox customCheckbox({
  required bool state,
  required void Function(bool?) onChanged,
}) {
  return Checkbox(
    value: state,
    onChanged: onChanged,
    activeColor: ManagerColors.primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ManagerRadius.r4)),
  );
}
