import 'dart:io';

import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_icons.dart';
import 'package:flutter/material.dart';

class IconService {
  final Map<IconData, IconData> icons = {
    ManagerIcons.arrow_back_android: ManagerIcons.arrow_back_ios,
  };

  IconData? getPlatformIcon(IconData icon) {
    if (Platform.isIOS) {
      if (icons.containsKey(icon)) {
        return icons[icon];
      } else if (icons.containsValue(icon)) {
        return icon;
      }
    } else {
      if (icons.containsKey(icon)) {
        return icon;
      } else if (icons.containsValue(icon)) {
        return icons.entries.firstWhere((entry) => entry.value == icon).key;
      }
    }
    return icon;
  }

  Icon getIcon({required IconData icon, Color? color, double? iconSize}) {
    return Icon(
      getPlatformIcon(icon),
      color: color ?? ManagerColors.white,
      size: iconSize ?? 20,
    );
  }
}
