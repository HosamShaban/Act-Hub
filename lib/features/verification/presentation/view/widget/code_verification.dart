import 'package:acthub/core/resources/manager_size.dart';
import 'package:flutter/material.dart';

import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager_colors.dart';

class CodeVerification extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode previousFocusNode;
  final void Function(String value) onChanged;
  final String? Function(String?)? validator;

  const CodeVerification({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.previousFocusNode,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        keyboardType: TextInputType.number,
        maxLength: Constants.codeVerificationMaxLine,
        textInputAction: TextInputAction.done,
        cursorColor: ManagerColors.primaryColor,
        onChanged: (value) {
          onChanged(value);
          if (value.isEmpty) {
            previousFocusNode.requestFocus();
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            filled: true,
            fillColor: ManagerColors.fillInputVerification,
            counterText: '',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ManagerRadius.r10,
              ),
              borderSide: BorderSide(
                width: ManagerWidth.w1,
                color: ManagerColors.focusedBorderInputVerification,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ManagerRadius.r10,
              ),
              borderSide: BorderSide(
                width: ManagerWidth.w1,
                color: Colors.white,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: ManagerColors.enabledBorderInputVerification))),
      ),
    );
  }
}
