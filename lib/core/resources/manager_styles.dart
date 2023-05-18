import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle(
    {required double fontSize,
    required String fontFamily,
    required FontWeight fontWeight,
    required Color color,
    required TextDecoration decoration,
    }) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getRegularTextStyle({required double fontSize,
required Color color,
TextDecoration decoration = TextDecoration.none,

}){
  return _textStyle(
      fontSize: fontSize,
      color: color,
     fontFamily: ManagerFontFamily.fontFamily,
     fontWeight: ManagerFontWight.regular,
     decoration: decoration
  );
}

TextStyle getBoldTextStyle({required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,

}){
  return _textStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: ManagerFontFamily.fontFamily,
      fontWeight: ManagerFontWight.bold,
      decoration: decoration
  );
}

TextStyle getMediumTextStyle({required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,

}){
  return _textStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: ManagerFontFamily.fontFamily,
      fontWeight: ManagerFontWight.medium,
      decoration: decoration
  );
}

