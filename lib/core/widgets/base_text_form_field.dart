import 'package:acthub/core/extensions/extensions.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:flutter/material.dart';

import '../resources/manager_colors.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';

TextFormField baseTextFormField({
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  bool? obscureText,
  validator,
  FocusNode? focusNode,
  onChange,
}) {
  return TextFormField(
    style: getRegularTextStyle(
      fontSize: ManagerFontSize.s16,
      color: ManagerColors.black,
    ),
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText.onNull(),
    validator: validator,
    focusNode: focusNode,
    onChanged: onChange ?? (val) {},
    decoration: InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h6,
      ),
      fillColor: ManagerColors.white,
      hintText: hintText.onNull(),
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
    ),
  );
}
