import 'package:flutter/cupertino.dart';

Widget willPopScope({
  required Widget child,
  WillPopCallback? onWillPop,
}) {
  return WillPopScope(
    child: child,
    onWillPop: () async => false,
  );
}
