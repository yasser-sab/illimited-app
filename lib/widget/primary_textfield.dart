import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';

class PrimaryTextfield extends StatelessWidget {
    final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final bool? isMultiLine;
  final String? hintText;
  final bool? isEnabled;
  const PrimaryTextfield({super.key, required this.controller, this.keyboardType, this.validator, this.hintText, this.isMultiLine, this.maxLines, this.isEnabled, this.minLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      keyboardType: keyboardType,
      enabled: isEnabled,
      controller: controller,
      style: getFontStyle(context).copyWith(color: Colors.black),
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1.5,
              color: errorColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 3,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10)),
        hintStyle:
            getFontStyle(context).copyWith(color: Colors.black.withOpacity(0.5)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: primaryColor,
            ),
          // borderSide: BorderSide.none,
        ),
        filled: true,
        
        fillColor: primaryColor.withOpacity(0.1),
      ),
    );
  }
}