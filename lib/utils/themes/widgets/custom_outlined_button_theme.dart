import 'package:flutter/material.dart';

import '../../constants/custom_colorsd.dart';
import '../../constants/custome_sizes.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomeColors.dark,
      side: const BorderSide(color: CustomeColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: CustomeColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding:  EdgeInsets.symmetric(
        vertical: CustomeSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomeSizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CustomeColors.light,
      side: const BorderSide(color: CustomeColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: CustomeColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      padding:  EdgeInsets.symmetric(
        vertical: CustomeSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomeSizes.buttonRadius),
      ),
    ),
  );
}
