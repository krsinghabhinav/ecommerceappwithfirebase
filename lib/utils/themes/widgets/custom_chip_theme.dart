import 'package:flutter/material.dart';

import '../../constants/custom_colorsd.dart';

class CustomChipTheme {
  CustomChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: CustomeColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: CustomeColors.black),
    selectedColor: CustomeColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CustomeColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CustomeColors.darkerGrey,
    labelStyle: TextStyle(color: CustomeColors.white),
    selectedColor: CustomeColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CustomeColors.white,
  );
}
