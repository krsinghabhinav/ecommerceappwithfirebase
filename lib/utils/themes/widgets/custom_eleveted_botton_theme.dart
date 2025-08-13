import 'package:flutter/material.dart';

import '../../constants/custom_colorsd.dart';
import '../../constants/custome_sizes.dart';

class CustomElevetedBottonTheme {
  CustomElevetedBottonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomeColors.light,
      backgroundColor: CustomeColors.primary,
      disabledForegroundColor: CustomeColors.darkGrey,
      disabledBackgroundColor: CustomeColors.buttonDisabled,
      side: const BorderSide(color: CustomeColors.light),
      padding:  EdgeInsets.symmetric(vertical: CustomeSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: CustomeColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomeSizes.buttonRadius),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomeColors.light,
      backgroundColor: CustomeColors.primary,
      disabledForegroundColor: CustomeColors.darkGrey,
      disabledBackgroundColor: CustomeColors.darkerGrey,
      side: const BorderSide(color: CustomeColors.primary),
      padding:  EdgeInsets.symmetric(vertical: CustomeSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: CustomeColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomeSizes.buttonRadius),
      ),
    ),
  );
}
