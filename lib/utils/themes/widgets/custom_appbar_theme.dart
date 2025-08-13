import 'package:flutter/material.dart';

import '../../constants/custom_colorsd.dart';
import '../../constants/custome_sizes.dart';

class CustomAppbarTheme {
  CustomAppbarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: CustomeColors.black,
      size: CustomeSizes. iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: CustomeColors.black,
      size: CustomeSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: CustomeColors.black,
    ),
  );
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: CustomeColors.white,
      size: CustomeSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: CustomeColors.white,
      size: CustomeSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: CustomeColors.white,
    ),
  );
}
