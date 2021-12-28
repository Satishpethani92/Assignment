import 'package:assignment/core/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MyTextField({TextEditingController? controller,
  InputBorder? border,
  String? hintText,
  TextStyle? hintStyle,
  IconData? prefix,
  IconData? suffixIcon,
  GestureTapCallback? onTapSuffix,
  bool? obscureText,
  FormFieldValidator<String>? validator
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: TextFormField(
      validator:validator,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          border: border,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(color: ColorConstants.black.withOpacity(.8)),
          prefixIcon: Icon(prefix, color: ColorConstants.black),
          suffixIcon: suffixIcon != null
              ? GestureDetector(
              onTap: onTapSuffix,
              child: Icon(suffixIcon, color: ColorConstants.black))
              : null),
    ),
  );
}
