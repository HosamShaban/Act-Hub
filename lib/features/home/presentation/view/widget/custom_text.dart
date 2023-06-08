import 'package:acthub/core/resources/manager_colors.dart';
import 'package:acthub/core/resources/manager_fonts.dart';
import 'package:acthub/core/resources/manager_size.dart';
import 'package:acthub/core/resources/manager_styles.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.name,
      required this.nameButton,
      required this.buttonColor})
      : super(key: key);

  final String name;
  final String nameButton;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w10, vertical: ManagerHeight.h20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              nameButton,
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s14, color: buttonColor),
            ),
          ),
        ],
      ),
    );
  }
}
