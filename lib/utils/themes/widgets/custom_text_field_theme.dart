import 'package:flutter/material.dart';

import '../../constants/custom_colorsd.dart';
import '../../constants/custome_sizes.dart';

class CustomTextFieldTheme {
  CustomTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomeColors.darkGrey,
    suffixIconColor: CustomeColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: CustomeSizes.fontSizeMd,
      color: CustomeColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: CustomeSizes.fontSizeSm,
      color: CustomeColors.black,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: CustomeColors.black.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CustomeColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: CustomeColors.darkGrey,
    suffixIconColor: CustomeColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      fontSize: CustomeSizes.fontSizeMd,
      color: CustomeColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: CustomeSizes.fontSizeSm,
      color: CustomeColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: CustomeColors.white.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomeColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomeSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CustomeColors.warning),
    ),
  );
}
